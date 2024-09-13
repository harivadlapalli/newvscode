public class PreventEditOfAcct {
    public static void preventEditOfAcctMethod(List<Account> accList){
        for(Account acc : accList){
            if(acc.createddate < System.Today() - 6 ){
                acc.addError('You cannot update account created 7 days back');
            }
        }
    }
}