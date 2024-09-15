public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        return [select Name, Industry from Account];
    }
}