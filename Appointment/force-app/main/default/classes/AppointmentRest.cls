@RestResource(urlMapping = '/appointments/*')
public with sharing class AppointmentRest {
     
    global static HttpResponse doPost(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://ap15.salesforce.com/services/apexrest/appointments');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody('{"appointment":{"Name": "New Appointment", "Client_First_Name__c": "Peter", "Client_Last_Name__c": "Doe", "Appointment_Date__c": "2019-12-19", "Start_Time__c": "12.30", "End_Time__c": "13.00", "Account_Name__c": "New Account"}}');
        return http.send(request);
    }  
}
