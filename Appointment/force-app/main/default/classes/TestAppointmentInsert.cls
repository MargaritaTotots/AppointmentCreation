@isTest
private with sharing class TestAppointmentInsert {

     @isTest static void testAppointmentCreationNewTrigger(){
        Appointment__c appointment = new Appointment__c();
        Date appointmentDate = Date.newInstance(2019, 12, 19);
        Time appointmentStartTime = Time.newInstance(12, 30, 0, 0);
        Time appointmentEndTime = Time.newInstance(13, 0, 0, 0);
        boolean success = true;
        try{
            appointment.Name = 'New Appointment';
            appointment.Client_First_Name__c = 'Peter';
            appointment.Client_Last_Name__c = 'Doe';
            appointment.Appointment_Date__c = appointmentDate;
            appointment.Start_Time__c = appointmentStartTime;
            appointment.End_Time__c = appointmentEndTime;
            appointment.Account_Name__c = 'New Account For Test';
            Test.startTest();
            Database.SaveResult result = Database.insert(appointment, false);
            Test.stopTest();
            Appointment__c actualValue = [Select Id, Name, Client_First_Name__c,Client_Last_Name__c, Appointment_Date__c, Start_Time__c, End_Time__c, Account_Name__c From  Appointment__c WHERE Id = :appointment.Id Limit 1 ];
            Account newAccount = [Select Id, Name From Account Where Name = :appointment.Account_Name__c];
            System.assertEquals(appointment, actualValue);
        }catch(Exception e){
            success = false;
        } finally{
            System.assert(success);
        }
    }
}
