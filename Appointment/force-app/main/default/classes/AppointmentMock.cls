@isTest
global with sharing class AppointmentMock implements HttpCalloutMock {

     global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type','application/json');
        response.setBody('{"appointment":{"Name": "New Appointment", "Client_First_Name__c": "Peter", "Client_Last_Name__c": "Doe", "Appointment_Date__c": "2019-12-19", "Start_Time__c": "12.30", "End_Time__c": "13.00", "Account_Name__c": "New Account"}}');
        response.setStatusCode(200);
        return response;
    }

}
