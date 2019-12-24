@isTest
private with sharing class TestAppointmentInsert {

      @isTest static void testAppointmentCreationNewTriggerNewAccount(){
        Appointment__c appointment = new Appointment__c();
        
        appointment.Name = 'New Test Appointment';
        appointment.Client_First_Name__c = 'Peter';
        appointment.Client_Last_Name__c = 'Doe';
        appointment.Appointment_Date__c = Date.newInstance(2019, 12, 19);
        appointment.Start_Time__c = Time.newInstance(12, 30, 0, 0);
        appointment.End_Time__c = Time.newInstance(13, 0, 0, 0);
        appointment.Account_Name__c = 'New Account For Test';
        
        insert appointment;
        
        Appointment__c actualValue = [SELECT Id, Name, Client_First_Name__c,Client_Last_Name__c, 
                                      Appointment_Date__c, Start_Time__c, End_Time__c, Account_Name__c, Account_Id__c 
                                      FROM  Appointment__c 
                                      WHERE Id = :appointment.Id 
                                      LIMIT 1 ];
        
        Account newAccount = [SELECT Id, Name 
                              FROM Account 
                              WHERE Name = :appointment.Account_Name__c 
                              LIMIT 1];
        
        appointment.Account_Id__c = newAccount.Id;
        
        System.assertEquals(appointment, actualValue);
        System.assertEquals(newAccount.Id, actualValue.Account_Id__c);
    }
    
    @isTest static void testAppointmentCreationNewTriggerExistAccount(){
        Appointment__c appointment = new Appointment__c();
        
        appointment.Name = 'New Appointment';
        appointment.Client_First_Name__c = 'Harry';
        appointment.Client_Last_Name__c = 'Doe';
        appointment.Appointment_Date__c = Date.newInstance(2019, 12, 19);
        appointment.Start_Time__c = Time.newInstance(12, 30, 0, 0);
        appointment.End_Time__c = Time.newInstance(13, 0, 0, 0);
        appointment.Account_Name__c = 'New Account';
        
        insert appointment;
        
        Appointment__c actualValue = [SELECT Id, Name, Client_First_Name__c,Client_Last_Name__c, 
                                      Appointment_Date__c, Start_Time__c, End_Time__c, Account_Name__c 
                                      FROM  Appointment__c 
                                      WHERE Id = :appointment.Id 
                                      LIMIT 1 ];
        
        System.assertEquals(appointment, actualValue);
    }
}
