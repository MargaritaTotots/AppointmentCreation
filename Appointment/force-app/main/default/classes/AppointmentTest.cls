@isTest
private with sharing class AppointmentTest {

    @isTest static void testDoPost(){
        Test.setMock(HttpCalloutMock.class, new AppointmentMock());
        HttpResponse response = AppointmentRest.doPost();
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        String expectedValue = '{"appointment":{"Name": "New Appointment", "Client_First_Name__c": "Peter", "Client_Last_Name__c": "Doe", "Appointment_Date__c": "2019-12-19", "Start_Time__c": "12.30", "End_Time__c": "13.00", "Account_Name__c": "New Account"}}';
        System.assertEquals(expectedValue, actualValue);
        System.assertEquals(200, response.getStatusCode());
    }
    
}
