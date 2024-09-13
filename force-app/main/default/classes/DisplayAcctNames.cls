public with sharing class DisplayAcctNames {
    @AuraEnabled(cacheable = true)
    public static List<Account> displayAcctNamesMethod() {
        return [select id, name from Account];
    }
}