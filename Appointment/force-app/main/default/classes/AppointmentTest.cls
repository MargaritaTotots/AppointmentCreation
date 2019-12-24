@isTest
private with sharing class AppointmentTest {
       
     @isTest static void testDoPost(){
        Appointment__c appointment = new Appointment__c();
        
        appointment.Name = 'New Appointment';
        appointment.Client_First_Name__c = 'Peter';
        appointment.Client_Last_Name__c = 'Doe';
        appointment.Appointment_Date__c = Date.newInstance(2019, 12, 19);
        appointment.Start_Time__c = Time.newInstance(12, 30, 0, 0);
        appointment.End_Time__c = Time.newInstance(13, 0, 0, 0);
        appointment.Account_Name__c = 'New Account';
        
        Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(AppointmentRest.doPost(appointment));  
        
        System.assertEquals(response.get('success'), true);  
    }
    
    @isTest static void testDoPostWithException(){
        Appointment__c appointment = new Appointment__c();
        
        appointment.Name = 'New Appointment';
        appointment.Client_First_Name__c = 'Peter';
        appointment.Client_Last_Name__c = 'Doe';
        appointment.Appointment_Date__c = Date.newInstance(2019, 12, 19);
        appointment.Start_Time__c = Time.newInstance(12, 30, 0, 0);
        appointment.End_Time__c = Time.newInstance(13, 0, 0, 0);

        Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(AppointmentRest.doPost(appointment));  

        System.assertEquals(response.get('success'), false);
    }

}
