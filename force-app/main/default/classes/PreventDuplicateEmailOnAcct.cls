public class PreventDuplicateEmailOnAcct {
    public static void preventDuplicateEmailOnAcctMethod(List<Account> accList) {
        Set<String> emails = new Set<String>();
        Set<Id> accIds = new Set<Id>();
        for(Account acc : accList){
            emails.add(acc.email__C);
            accIds.add(acc.Id);
        }
        for(Account acc1 : [select id,email__C from account where Id NOT IN:accIds AND email__C IN:emails]){
            for(Account acc : accList){
                if(acc1.Email__c == acc.Email__c){
                    acc.addError('Duplicate Email Not allowed:');
                }
            }
        }
    }
}