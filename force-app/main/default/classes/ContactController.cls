public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static list<Contact> getContacts(){
        try {
            return [select FirstName,LastName,Email from Contact];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}