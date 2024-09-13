public class ContactNOppoOnCheckBox {
    public static void contactNOppoOnCheckBoxMethod(List<Account> accList) {
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for (Account acc : accList) {
            if (acc.Contact__c == true) {
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.LastName = acc.Name;
                conList.add(con);
            }
            if (acc.Opportunity__c == true && acc.Active__c == 'Yes') {
                Opportunity opp = new Opportunity();
                opp.AccountId = acc.Id;
                opp.Name = acc.Name;
                opp.StageName = 'Prospect';
                opp.CloseDate = System.Today();
                oppList.add(opp);
            }
        }
        
        // Insert the new Contacts and Opportunities
        if (!conList.isEmpty()) {
            insert conList;
        }
        if (!oppList.isEmpty()) {
            insert oppList;
        }
    }
}