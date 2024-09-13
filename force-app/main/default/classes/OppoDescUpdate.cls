public class OppoDescUpdate {
    public static void oppoDescUpdateMethod(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount != null && opp.Amount > 100000){
                opp.Description = 'Hot Opportunity';
            }
        }
    }
}