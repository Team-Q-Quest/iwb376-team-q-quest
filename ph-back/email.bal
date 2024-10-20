import ballerina/email;

isolated function sendAdminNotification() returns error? {
    //didn't add to the public
    email:SmtpClient smtpClient = check new ("smtp.gmail.com", "my_mail@email.com" , "password_key");

    
    email:Message email = {
      
        to: "pesara.21@cse.mrt.ac.lk",
       
        subject: "New Pharmacy registration",
        // Body content (text) of the email is added as follows. This field is optional.
        body: "New pharmacy has been requesting to join our System. Please verfy the details to add them into our system"
    };

   
    check smtpClient->sendMessage(email);
}
