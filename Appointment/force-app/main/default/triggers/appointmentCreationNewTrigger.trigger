trigger appointmentCreationNewTrigger on Appointment__c (before insert) {
   Set<String> accountNameSet = new Set<String>();
    
    for(Appointment__c appointment : Trigger.New){
        accountNameSet.add(appointment.Account_Name__c);
    }
    
    List<Account> accounts = [Select id, Name From Account Where Name IN :accountNameSet];
    Set<String> accountSet = new Set<String>();
    
    for(Account account : accounts){
        accountSet.add(account.Name);
    }
    
    List<Account> newAccounts = new List<Account>();
    List<Appointment__c> newAppointments = new List<Appointment__c>();
    
    for(Appointment__c appointment : Trigger.New){
        if(!accountSet.contains(appointment.Account_Name__c)){
            Account newAccount = new Account(Name = appointment.Account_Name__c);
            newAccounts.add(newAccount);
            newAppointments.add(appointment);
        }else{
            for(Account account: accounts){
                if(account.Name.equals(appointment.Account_Name__c)){
                    appointment.Account_Id__c = account.Id;
                    break;
                }
            }
        }
    }
    
    insert newAccounts;
    
    Integer i = 0;
    
    for(Appointment__c appointment : newAppointments){
        appointment.Account_Id__c = newAccounts[i].Id;
        i++;
    }
}