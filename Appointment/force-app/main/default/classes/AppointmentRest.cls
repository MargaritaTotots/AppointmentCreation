@RestResource(urlMapping = '/appointments/*')
public with sharing class AppointmentRest {
     
    @HttpPost
    global static void doPost(Appointment__c appointment ){
        appointment.Account_Name__c = account_name;*/
        try{
        Database.SaveResult result = Database.insert(appointment,false);
        RestContext.response.addHeader('Content-Type', 'application/json');
        if(result.isSuccess()) RestContext.response.responseBody = Blob.valueOf('{ "id" : "' + appointment.Id +'", "success" : "true", "errors" : "[]" }');
        else {
            RestContext.response.responseBody = Blob.valueOf('{ "id" : "' + appointment.Id +'", "success" : "false", "errors" : "[]" }');
        }
        }catch(Exception e){
            RestContext.response.responseBody = Blob.valueOf('{ "id" : "' + appointment.Id +'", "success" : "false", "errors" : "'+ e.getMessage() +'" }');
        }
    }
}
