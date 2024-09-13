public class RecursiveTriggerOnAcct {
    public static void recursiveTriggerOnAcctMethod(List<Account> newList){
        List<Account> updatedAccList = new List<Account>();
        for(Account acct : newList){
            /*if(PreventRecursion.processedRecords.contains(acct.Id)){
                continue;
                System.debug('Record already Proccessed:');
            }
			PreventRecursion.processedRecords.add(acct.Id);*/
            //Way 3
             if(PreventRecursion.processedRecordsIds.containsKey(acct.Id) && PreventRecursion.processedRecordsIds.get(acct.Id)){
                continue;
                System.debug('Record already Proccessed:');
            }
			PreventRecursion.processedRecordsIds.put(acct.Id,true);
            
            Account acc = new Account(id = acct.id);
            acc.Description = 'Description Updated';
            updatedAccList.add(acc);
        }
        if(!updatedAccList.isEmpty()){
            update updatedAccList;
        }
    }
}