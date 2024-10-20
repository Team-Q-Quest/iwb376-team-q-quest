import ballerina/http;
import ballerina/io;
import ballerina/sql;

@http:ServiceConfig {
    cors: {
        allowOrigins: ["http://localhost:5173"],
        allowMethods: ["GET", "POST", "DELETE", "PUT", "OPTIONS"]
    }
    // ,
    // auth: [
    //     {
    //         jwtValidatorConfig: {
    //             issuer: "wso2",
    //             audience: "ballerina",
    //             signatureConfig: {
    //                 certFile: "resources/public.crt"
    //             }
    //         },
    //         scopes: ["admin"]
    //     }
    // ]
}
service /userApp on new http:Listener(9090) {
    isolated resource function get medicineList() returns MedicineName[]|error {
        return selectAllMedicine();
    };

    // todo: this end point is not completed
    isolated resource function post phList(http:Request req) returns Pharmacy[]|error? {
        json? jsonPayload = check req.getJsonPayload();
        NewRecord medList = check jsonPayload.cloneWithType(NewRecord);
        io:println(medList.location.latitude);
        return getBestMatch(medList.tags, medList.location.latitude, medList.location.longitude, 20);
    }

    isolated resource function post createPharmacy(http:Request req) returns sql:ExecutionResult|error? {
        json? jsonPayload = check req.getJsonPayload();
        Pharmacy ph = check jsonPayload.cloneWithType(Pharmacy);
        return insertPharmacy(ph);
    }

    isolated resource function post signIn(http:Request req) returns SignInResponse|error {
        json? jsonPayload = check req.getJsonPayload();
        Email email = check jsonPayload.cloneWithType(Email);
        return verifyEmail(email);
    }

    isolated resource function post addMedincine(http:Request req) returns sql:ExecutionResult|error {
        json? jsonPayload = check req.getJsonPayload();
        Medicine medicine = check jsonPayload.cloneWithType(Medicine);
        return addMedincine(medicine);
    }

    isolated resource function put updateMedincine(http:Request req) returns sql:ExecutionResult|error {
        json? jsonPayload = check req.getJsonPayload();
        Medicine medicine = check jsonPayload.cloneWithType(Medicine);
        return updateMedincine(medicine);
    }

    isolated resource function delete deleteMedincine/[int pharmacy_id](string name) returns sql:ExecutionResult|error? {
        return deleteItem(name, pharmacy_id);
    }

    isolated resource function get setMedincine/[int pharmacy_id]() returns Medicine[]|error? {
        return setMedincine(pharmacy_id);
    }

    isolated resource function get getPharmacyData/[int pharmacy_id]() returns Pharmacy|error? {
        return getPhDetails(pharmacy_id);
    }

    isolated resource function get getPharmacyList() returns Pharmacy[]|error? {
        return getAllthePharmacies();
    }

    isolated resource function put updateApproval/[int pharmacy_id](http:Request req) returns sql:ExecutionResult|error {
        json? jsonPayload = check req.getJsonPayload();

        boolean approval = check jsonPayload?.approval;

        return setApproval(pharmacy_id, approval);
    }

    isolated resource function get getAdminData/[int admin_id]() returns Admin|error {
        return getAdminDetails(admin_id);
    };

}
