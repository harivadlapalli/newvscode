public class CaseNumOnAcct {
    public static void CaseNumOnAcctMethod(List<Case> caseList){
        List<Account> accList = new List<Account>();
        for(Case newCase : caseList){
            if(newCase.AccountId != null){
               Account acc = new Account();
               acc.id = newCase.AccountId;
               acc.Latest_Case_Number__c=newCase.Id;
               accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}