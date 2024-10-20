public type Medicine record {|
    int medicine_id?;
    string name;
    string description;
    decimal price;
    int pharmacy_id?;
    int quantity?;
    string threshold?;
|};

public type MedicineName record {|
    string name; 
    int medicine_id?; 
|};

public type Admin record{|
    int admin_id?;
    string admin_name?;
    string admin_email?;

|};

public type Email record {|
    string email;  
|};
public type SignInResponse record {|
    boolean isValid?; 
    boolean isSystemAdmin?;
    int ph_id?; 
    int admin_id?;

|};
public type Pharmacy record {|
    int pharmacy_id?;
    string email?;
    string name;
    string address;
    string city;
    string phone_number;
    string open_hour;
    string close_hour;
    decimal latitude;
    decimal longitude;
    string img?;
    float distance?;
    boolean approved?;

|};

type Location record {
    decimal latitude;
    decimal longitude;
};

type NewRecord record {
    string tags;
    Location location;
};

type Stock record {| 
    int pharmacy_id; 
    int medicine_id;
    int quantity;
|};