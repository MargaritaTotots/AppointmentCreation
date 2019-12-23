@RestResource(urlMapping = '/appointments/*')
public with sharing class AppointmentRest {
     
     @HttpPost
    global static HttpResponse doPost(Appointment__c appointment){
        RestResponse response = RestContext.response;
        String error = '';
        Database.SaveResult result = Database.insert(appointment,false);
        if(result.isSuccess()) {
          // response.addHeader('Content-Type', 'application/json');
          // response.responseBody = Blob.valueOf('{ "id" : "' + appointment.Id +'", "success" : "true", "errors" : "[]" }');
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
