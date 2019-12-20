trigger appointmentCreationNewTrigger on Appointment__c (before insert) {
    List<Appointment__c> newList = Trigger.New;
    Account newAccount;
    Set<String> nameSet = new Set<String>();
    List<Appointment__c> newAppointment = new List<Appointment__c>();
    List<Account> accounts = [Select id, Name From Account];
    List<Account> newAccounts = new List<Account>();
    Integer i = 0;
    
    for(Account account : accounts){
        nameSet.add(account.Name);
    }
    
    for(Appointment__c a : newList){
        if(!nameSet.contains(a.Account_Name__c)){
            newAccount = new Account(Name = a.Account_Name__c);
            newAccounts.add(newAccount);
            newAppointment.add(a);
            System.debug('Account with Name = ' + newAccount.Name);
        }
        else{
            for(Account account: accounts){
                if(account.Name.equals(a.Account_Name__c)){
                    a.Account_Id__c = account.Id;
                    break;
                }
            }
        }
    }
    
    insert newAccounts;
    
    for(Appointment__c a : newAppointment){
        a.Account_Id__c = newAccounts[i].Id;
        i++;
    }
}