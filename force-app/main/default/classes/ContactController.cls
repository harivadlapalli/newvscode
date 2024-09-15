public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByAccountId(Id accountId){
        return [select id,AccountId,name from Contact where AccountId =:accountId];
    }
}