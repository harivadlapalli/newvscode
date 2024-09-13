public class UpdateRelatedRecordsCountONAcct {
    public static void UpdateRelatedRecordsCountONAcctMethod(){
        List<Account> acctRelatedRecords = [select Id,Name,(select Id,Name from Opportunities) from Account];
        List<Account> accToBeUpdate = new List<Account>();
        for(Account acc : acctRelatedRecords){
            //System.debug(acc.Name + ' ' +acc.Opportunities.size());
            acc.Total_Child_Count__c = acc.Opportunities.size();
            //System.debug(acc.Total_Child_Count__c);
            accToBeUpdate.add(acc);
        }
        update accToBeUpdate;
    }
}