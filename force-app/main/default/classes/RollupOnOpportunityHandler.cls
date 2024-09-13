public class RollupOnOpportunityHandler {
    public static void rollupOnOpportunityMethod(List<Opportunity> oppList, Map<Id,Opportunity> oppMap){
        Set<Id> accIds =new set<Id>();
        // for insert
        if(oppList.size()>0){
            for(Opportunity opp : oppList){
                accIds.add(opp.accountId);
            }
        }
        // for Update
        if(oppList != null && oppMap != null){
            for(Opportunity opp : oppList){
                if(opp.accountId != oppMap.get(opp.Id).accountId){
                    accIds.add(opp.accountId);
                    accIds.add(oppMap.get(opp.Id).accountId);
                }
            }
        }
        System.debug(accIds);
        List<Account> updateToAccount = new List<Account>();
        List<AggregateResult> aggregateResult = [select accountId, count(Id) totCount from Opportunity where accountId In 
                                                 :accIds GROUP BY accountId];
        System.debug(aggregateResult);
        for(AggregateResult ar : aggregateResult){
            Account acc = new Account(Id = (Id)ar.get('AccountId'),Total_Child_Count__c = (Decimal)ar.get('totCount'));
            updateToAccount.add(acc);
        }
        System.debug(updateToAccount);
        if(!updateToAccount.isEmpty()){
            update updateToAccount;
         }
    }
}