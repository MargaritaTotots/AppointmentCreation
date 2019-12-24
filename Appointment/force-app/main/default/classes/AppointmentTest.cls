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
        
        AppointmentRest.doPost(appointment);
        
        Appointment__c actualValue = [SELECT Id, Name, Client_First_Name__c, Client_Last_Name__c,
                                      Appointment_Date__c, Start_Time__c, End_Time__c, Account_Name__c
                                      FROM Appointment__c
                                      WHERE Id = :appointment.Id
                                      LIMIT 1 ];
        
        System.assertEquals(appointment, actualValue);   
    }
    
    @isTest static void testDoPostWithException(){
        Appointment__c appointment = new Appointment__c();
        
        appointment.Name = 'New Appointment';
        appointment.Client_First_Name__c = 'Peter';
        appointment.Client_Last_Name__c = 'Doe';
        appointment.Appointment_Date__c = Date.newInstance(2019, 12, 19);
        appointment.Start_Time__c = Time.newInstance(12, 30, 0, 0);
        appointment.End_Time__c = Time.newInstance(13, 0, 0, 0);

        AppointmentRest.doPost(appointment);  
    }

}
