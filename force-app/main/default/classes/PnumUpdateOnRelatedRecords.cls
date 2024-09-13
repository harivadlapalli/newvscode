public class PnumUpdateOnRelatedRecords {
    public static void pnumUpdateOnRelatedRecordsMethod(List<Account> newList, Map<Id,Account> oldMap){
        Map<Id,Account> accMap = new Map<Id,Account>();
        List<Contact> conList = new List<Contact>();
        for(Account acc : newList){
            if(acc.id == oldMap.get(acc.id).id && acc.Phone != oldMap.get(acc.Id).Phone){
                accMap.put(acc.Id,acc);
            }
        } 
        for(Contact cont : [select id, AccountId from contact where AccountId IN : accMap.keySet()]){
            if(accMap.containsKey(cont.AccountId)){
               cont.Phone = accMap.get(cont.AccountId).phone;
                conList.add(cont);
            }
        }
        if(conList.size()>0){
            update conList;
        }
    }
}