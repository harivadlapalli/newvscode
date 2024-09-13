public class OpportunityHandler {
    public static void updateAccountAnnualRevenue(Map<Id, Opportunity> oldMap, Map<Id, Opportunity> newMap, Boolean isDelete) {
        Set<Id> accountIds = new Set<Id>();
 
        if (oldMap != null) {
            for (Opportunity oldOpp : oldMap.values()) {
                accountIds.add(oldOpp.AccountId);
            }
        }
        if (newMap != null) {
            for (Opportunity newOpp : newMap.values()) {
                accountIds.add(newOpp.AccountId);
            }
        }
 
        accountIds.remove(null);
        
        Map<Id, Decimal> accountTotalAmounts = new Map<Id, Decimal>();
        
        for (AggregateResult result : [
            SELECT AccountId, SUM(Amount) sumAmount
            FROM Opportunity
            WHERE AccountId IN :accountIds
            GROUP BY AccountId
        ]) {
            accountTotalAmounts.put((Id)result.get('AccountId'), (Decimal)result.get('sumAmount'));
        }
        
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : accountIds) {
            Account acc = new Account(Id = accountId);
            acc.AnnualRevenue = accountTotalAmounts.get(accountId) != null ? accountTotalAmounts.get(accountId) : 0;
            accountsToUpdate.add(acc);
        }
        
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}