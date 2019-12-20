@RestResource(urlMapping = '/appointments/*')
public with sharing class AppointmentRest {
     
    @HttpPost
    global static void doPost(Appointment__c appointment ){
        String error = '';
        Database.SaveResult result = Database.insert(appointment,false);
        RestContext.response.addHeader('Content-Type', 'application/json');
        if(result.isSuccess()) {
            RestContext.response.responseBody = Blob.valueOf('{ "id" : "' + appointment.Id +'", "success" : "true", "errors" : "[]" }');
        }
        else {
            for(Database.Error err : result.getErrors())
            {
                error = error + err.getStatusCode() + ': ' + err.getMessage() + '\n';
            }
            RestContext.response.responseBody = Blob.valueOf('{ "id" : "' + appointment.Id +'", "success" : "false", "errors" : "[ ' + error +']" }');
        }
    }
}
