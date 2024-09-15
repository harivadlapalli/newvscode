/*public class BatchToUpdateOppCountInAcct implements Database.Batchable<sObject>{
    public Static Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([select Id,Name,(select Id,Name from Opportunities) from Account]);
    }
    public static void execute(Database.BatchableContext BC, List<Account> accList){
        for(Account acc : accList){
            acc.Total_Child_Count__c = acc.Opportunities.size();
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
     public static void finish(Database.BatchableContext BC){
        System.debug('Operation Completed Successfullyx`');
    }
}*/