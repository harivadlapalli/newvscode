public with sharing class AccountRecordsDisplay {

    @AuraEnabled(cacheable = true)
    public static List<Account> accountRecordsDisplay(){
        try {
            return [select id, Name from Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}