import ballerina/sql;
import ballerinax/mysql;

configurable int port = 3306;
configurable string host = "localhost";
configurable string user = "root";
configurable string database = "pharmacy_database";
configurable string password = "root";
configurable mysql:Options & readonly connectionOptions = {};

final mysql:Client dbClient = check new (
    host = host,
    port = port,
    database = database,
    user = user,
    password = password,
    options = connectionOptions
);

// final mysql:Client dbClient = check new(
//     host = "localhost",
//     port = 3306,
//     database = "pharmacy_database",
//     user =  "root",
//     password =  "1234",
//     options = {}
// );

isolated function selectAllMedicine() returns MedicineName[]|error {
    sql:ParameterizedQuery selectQuery = `SELECT name FROM medicine`;
    stream<MedicineName, error?> medicineNameStream = dbClient->query(selectQuery);
    return from MedicineName med in medicineNameStream
        select med;
}

isolated function getBestMatch(string medicineList, decimal input_latitude, decimal input_longitude, decimal range) returns Pharmacy[]|error {
    sql:ParameterizedQuery selectQuery = `call GetNearestPharmaciesWithMedicines(${input_latitude}, ${input_longitude}, ${medicineList}, ${range})`;
    stream<Pharmacy, error?> pharmacyStream = dbClient->query(selectQuery);
    return from Pharmacy ph in pharmacyStream
        select ph;
}

isolated function insertPharmacy(Pharmacy pharmacy) returns sql:ExecutionResult|error {
    Pharmacy {name, address, city, phone_number, open_hour, close_hour, latitude, longitude} = pharmacy;
    sql:ParameterizedQuery insertQuery = `INSERT INTO pharmacy (name, address, city, phone_number, open_hour, close_hour, latitude, longitude) VALUES (
                                            ${name}, ${address}, ${city}, ${phone_number}, ${open_hour}, ${close_hour}, ${latitude}, ${longitude})`;
    return dbClient->execute(insertQuery);
}

isolated function verifyEmail(Email email) returns SignInResponse|error {
    sql:ParameterizedQuery selectPharmacyAdminQuery = `SELECT pharmacy_id FROM pharmacy_admin where email = ${email.email}`;
    sql:ParameterizedQuery selectSystemAdminQuery = `SELECT admin_id FROM system_admin where admin_email = ${email.email}`;
    sql:ExecutionResult|error resultPharmacy = dbClient->queryRow(selectPharmacyAdminQuery);
    sql:ExecutionResult|error resultSystem = dbClient->queryRow(selectSystemAdminQuery);

    SignInResponse res = {ph_id: null,admin_id:null, isValid: false,isSystemAdmin:false};

    if (resultPharmacy is sql:ExecutionResult) {
        int ph_id = <int>resultPharmacy.get("pharmacy_id");
        res.ph_id =ph_id;
        res.isValid=true;
    } else if (resultSystem is sql:ExecutionResult) {
        int admin_id = <int>resultSystem.get("admin_id");
        res.admin_id= admin_id;
        res.isValid=true;
        res.isSystemAdmin=true;    
    }

    return res;
}

isolated function addMedincine(Medicine medicine) returns sql:ExecutionResult|error {
    Medicine {name, description, price, pharmacy_id, quantity} = medicine;
    sql:ParameterizedQuery selectQuery = `SELECT name, medicine_id FROM medicine WHERE name = ${name} limit 1`;
    stream<MedicineName, error?> resultStream = dbClient->query(selectQuery);
    MedicineName[]|error? result1 = from MedicineName med in resultStream
        select med;
    int medicine_id;
    if (result1 is MedicineName[] && result1.length() > 0) {
        medicine_id = <int>result1[0].get("medicine_id");
    } else {
        sql:ParameterizedQuery insertQuery1 = `INSERT INTO medicine (name, description, price) VALUES (${name}, ${description}, ${price})`;
        sql:ExecutionResult|error result2 = dbClient->execute(insertQuery1);
        if (result2 is sql:ExecutionResult) {
            medicine_id = <int>result2.lastInsertId;
        } else {
            return result2;
        }
    }
    sql:ParameterizedQuery insertQuery2 = `INSERT INTO stock (pharmacy_id, medicine_id, quantity) VALUES (${pharmacy_id}, ${medicine_id}, ${quantity})`;
    return dbClient->execute(insertQuery2);
}

isolated function updateMedincine(Medicine medicine) returns sql:ExecutionResult|error {
    Medicine {name, description, price, pharmacy_id, quantity} = medicine;
    sql:ParameterizedQuery selectQuery1 = `SELECT * FROM medicine where name = ${name}`;
    sql:ParameterizedQuery selectQuery2 = `SELECT * FROM stock where pharmacy_id = ${pharmacy_id} AND medicine_id = (SELECT medicine_id FROM medicine WHERE name = ${name})`;

    stream<Medicine, error?> resultStream1 = dbClient->query(selectQuery1);
    Medicine[]|error? result1 = from Medicine med in resultStream1
        select med;

    stream<Stock, error?> resultStream2 = dbClient->query(selectQuery2);
    Stock[]|error? result2 = from Stock stock in resultStream2
        select stock;

    sql:ExecutionResult|error dbres1 = {"affectedRowCount": 1, "lastInsertId": null};
    if (result1 is Medicine[] && result1.length() > 0 && (result1[0].get("description") != description || result1[0].get("price") != price)) {
        sql:ParameterizedQuery updateQuery1 = `UPDATE medicine SET description = ${description}, price = ${price} WHERE name = ${name}`;
        dbres1 = dbClient->execute(updateQuery1);
    }
    if (result2 is Stock[] && result2.length() > 0 && result2[0].get("quantity") != quantity) {
        sql:ParameterizedQuery updateQuery2 = `UPDATE stock SET quantity = ${quantity} WHERE pharmacy_id = ${pharmacy_id} AND medicine_id = (SELECT medicine_id FROM medicine WHERE name = ${name})`;
        return dbClient->execute(updateQuery2);
    }
    return dbres1;
}

isolated function deleteItem(string name, int pharmacy_id) returns sql:ExecutionResult|error {
    sql:ParameterizedQuery deleteQuery = `DELETE FROM stock WHERE pharmacy_id = ${pharmacy_id} AND medicine_id = (SELECT medicine_id FROM medicine WHERE name = ${name})`;
    return dbClient->execute(deleteQuery);
}

isolated function setMedincine(int pharmacy_id) returns Medicine[]|error {
    sql:ParameterizedQuery selectQuery = `SELECT m.medicine_id, m.name, m.description, m.price, s.pharmacy_id, s.quantity FROM  medicine m JOIN  stock s ON  m.medicine_id = s.medicine_id WHERE  s.pharmacy_id = ${pharmacy_id}`;
    stream<Medicine, error?> resultStream = dbClient->query(selectQuery);
    return from Medicine med in resultStream
        select med;
}

isolated function getPhDetails(int pharmacy_id) returns Pharmacy|error {
    sql:ParameterizedQuery selectQuery = `SELECT p.name ,p.address,p.phone_number,p.city,p.open_hour,p.close_hour from pharmacy as p where p.pharmacy_id= ${pharmacy_id}`;
    Pharmacy pharmacy = check dbClient->queryRow(selectQuery);
    return pharmacy;
}


isolated function getAllthePharmacies() returns Pharmacy[]|error {
    sql:ParameterizedQuery selectQuery = `select p.pharmacy_id, p.name, p.address,p.city,p.phone_number,p.approved,pa.email from pharmacy as p join pharmacy_admin as pa on p.pharmacy_id=pa.pharmacy_id`;
    stream<Pharmacy, error?> pharmacyStream = dbClient->query(selectQuery);
    return from Pharmacy ph in pharmacyStream
        select ph;
}


isolated function setApproval(int pharmacy_id, boolean approval) returns sql:ExecutionResult|error {
    sql:ParameterizedQuery setquery = `update pharmacy set approved =${approval}  where pharmacy_id = ${pharmacy_id}`;
     return dbClient->execute(setquery);

}

isolated function getAdminDetails(int admin_id) returns Admin|error{
    sql:ParameterizedQuery getQuery = `select * from system_admin where admin_id=${admin_id}`;
    Admin admin = check dbClient->queryRow(getQuery); 
    return admin;
}






