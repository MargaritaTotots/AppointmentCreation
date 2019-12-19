trigger appointmentCreationNewTrigger on Appointment__c (before insert) {
    List<Appointment__c> newList = Trigger.New;
    Account newAccount;
        List<Account> newAccounts = new List<Account>();
        for(Appointment__c a : newList){
            List<Account> accounts = [Select id, Name From Account Where Name=:a.Account_Name__c];
            if(accounts.size() == 0){
                newAccount = new Account(Name = a.Account_Name__c);
                insert newAccount;
                System.debug('Account with Id = '+ newAccount.Id+', Name = ' + newAccount.Name);
                a.Account_Id__c = newAccount.Id;
            }
            else{
                a.Account_Id__c = accounts.get(0).Id;
            }
            System.debug('Appointment with AccountName = ' + a.Account_Name__c + ', AccountId = ' + a.Account_Id__c);
        }
}