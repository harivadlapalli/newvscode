public with sharing class CustomContactController {
    // This method is cacheable and returns a list of Contact records
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        try {
            // Query to get all contacts
            return [SELECT Id, FirstName, LastName, Email FROM Contact LIMIT 100];
        } catch (Exception e) {
            // Handle any errors and return an empty list if there's an exception
            throw new AuraHandledException('Error retrieving Contacts: ' + e.getMessage());
        }
    }
}
