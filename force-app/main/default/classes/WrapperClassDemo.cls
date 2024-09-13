public with sharing class WrapperClassDemo {
    @AuraEnabled(cacheable = true)
    public static List<AccountWrapper> wrapperClassDemoMethod() {
        List<AccountWrapper> accWrapList= new List<AccountWrapper>();
        List<Account> accList = [select id, Name, (SELECT Id, FirstName, LastName FROM Contacts) 
                                    from Account];
        if (!accList.isEmpty()) {
            for (Account acc : accList) {
                accWrapList.add(new AccountWrapper(acc, acc.Contacts));
            }
        }
        return accWrapList;
    }

    public class AccountWrapper {
        @AuraEnabled public  Account accRecord {get; set;}
        @AuraEnabled public List<Contact> conList {get; set;}

        public AccountWrapper(Account accRecord, List<Contact> conList){
            this.accRecord = accRecord;
            this.conList = conList;
        }
    }
}