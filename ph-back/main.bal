import ballerina/http;
import ballerina/io;
import ballerina/jwt;
import ballerina/sql;

configurable string jwtIssuer = "pharmacy_api";
configurable string jwtAudience = "pharmacy_clients";
configurable string jwtSecret = "b8f2e6d4-9ad2-4f1b-80f9-8f9e8d9a6321";

@http:ServiceConfig {
    cors: {
        allowOrigins: ["http://localhost:5173"],
        allowMethods: ["GET", "POST", "DELETE", "PUT", "OPTIONS"]
    }
}
service /userApp on new http:Listener(9090) {
    isolated resource function get medicineList() returns MedicineName[]|error {
        return selectAllMedicine();
    }

    isolated resource function post phList(http:Request req) returns Pharmacy[]|error? {

        json? jsonPayload = check req.getJsonPayload();
        NewRecord medList = check jsonPayload.cloneWithType(NewRecord);
        io:println(medList.location.latitude);
        return getBestMatch(medList.tags, medList.location.latitude, medList.location.longitude, 20);
    }

    //@http:Header {name: "Authorization"}string authHeader,
    isolated resource function post createPharmacy(http:Request req) returns sql:ExecutionResult|error? {
        // jwt:Payload payload = check validateJwt(authHeader);
        // if payload.get("role") != "admin" {
        //     return error("Insufficient permissions");
        // }
        json? jsonPayload = check req.getJsonPayload();
        Pharmacy ph = check jsonPayload.cloneWithType(Pharmacy);
        return insertPharmacy(ph);
    }

    isolated resource function post signIn(http:Request req) returns SignInResponse|error {
        json? jsonPayload = check req.getJsonPayload();
        Email email = check jsonPayload.cloneWithType(Email);

        return verifyEmail(email);
    }

    //@http:Header {name: "Authorization"} string authHeader,
    isolated resource function post addMedincine(http:Request req) returns sql:ExecutionResult|error {
        // jwt:Payload payload = check validateJwt(authHeader);
        // if payload.get("role") != "pharmacy" {
        //     return error("Insufficient permissions");
        // }
        json? jsonPayload = check req.getJsonPayload();
        Medicine medicine = check jsonPayload.cloneWithType(Medicine);
        return addMedincine(medicine);
    }

    //@http:Header {name: "Authorization"} string authHeader,
    isolated resource function put updateMedincine(http:Request req) returns sql:ExecutionResult|error {
        // jwt:Payload payload = check validateJwt(authHeader);
        // if payload.get("role") != "pharmacy" {
        //     return error("Insufficient permissions");
        // }
        json? jsonPayload = check req.getJsonPayload();
        Medicine medicine = check jsonPayload.cloneWithType(Medicine);
        return updateMedincine(medicine);
    }

    //@http:Header {name: "Authorization"} string authHeader,
    isolated resource function delete deleteMedincine/[int pharmacy_id](string name) returns sql:ExecutionResult|error? {
        // jwt:Payload payload = check validateJwt(authHeader);
        // if payload.get("role") != "pharmacy" || payload.get("sub") != pharmacy_id.toString() {
        //     return error("Insufficient permissions");
        // }
        return deleteItem(name, pharmacy_id);
    }

    //string authHeader
    isolated resource function get setMedincine/[int pharmacy_id]() returns Medicine[]|error? {
        return setMedincine(pharmacy_id);
    }

    //string authHeader
    isolated resource function get getPharmacyData/[int pharmacy_id]() returns Pharmacy|error? {

        return getPhDetails(pharmacy_id);
    }

    //@http:Header {name: "Authorization"} string authHeader
    isolated resource function get getPharmacyList() returns Pharmacy[]|error? {
        // jwt:Payload payload = check validateJwt(authHeader);
        // if payload.get("role") != "admin" {
        //     return error("Insufficient permissions");
        // }
        return getAllthePharmacies();
    }

    //@http:Header {name: "Authorization"} string authHeader,
    isolated resource function put updateApproval/[int pharmacy_id](http:Request req) returns sql:ExecutionResult|error {
        // jwt:Payload payload = check validateJwt(authHeader);
        // if payload.get("role") != "admin" {
        //     return error("Insufficient permissions");
        // }
        json? jsonPayload = check req.getJsonPayload();
        boolean approval = check jsonPayload?.approval;
        return setApproval(pharmacy_id, approval);
    }

    //@http:Header {name: "Authorization"} string authHeader
    isolated resource function get getAdminData/[int admin_id]() returns Admin|error {
        // jwt:Payload payload = check validateJwt(authHeader);
        // if payload.get("role") != "admin" || payload.get("sub") != admin_id.toString() {
        //     return error("Insufficient permissions");
        // }
        return getAdminDetails(admin_id);
    }
}

isolated function validateJwt(string authHeader) returns jwt:Payload|error {
    if !authHeader.startsWith("Bearer ") {
        return error("Invalid authorization header");
    }
    string token = authHeader.substring(7);
    return validateToken(token);
}

isolated function validateToken(string token) returns jwt:Payload|error {
    jwt:ValidatorConfig validatorConfig = {
        issuer: jwtIssuer,
        audience: jwtAudience,
        signatureConfig: {
            certFile: jwtSecret
        }
    };

    return jwt:validate(token, validatorConfig);
}

isolated function generateToken(int id, boolean isSystemAdmin) returns string|error {
    jwt:IssuerConfig issuerConfig = {
        username: id.toString(),
        issuer: jwtIssuer,
        audience: jwtAudience,
        signatureConfig: {
            config: {
                keyFile: jwtSecret
            }
        },
        expTime: 3600 // Token expires in 1 hour
    };

    if (isSystemAdmin) {
        issuerConfig.customClaims = {"role": "admin"};
    } else {
        issuerConfig.customClaims = {"role": "pharmacy"};
    }

    return jwt:issue(issuerConfig);
}
