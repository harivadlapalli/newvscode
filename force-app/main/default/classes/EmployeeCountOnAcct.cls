public class EmployeeCountOnAcct {
    public static void employeeCountOnAcctMethod(List<Employee__c> listEmp){
        Set<Id> accIds = new Set<Id>();
        // for insert
        for(Employee__c emp : listEmp){
            accIds.add(emp.Account__C);
        }
        List<AggregateResult> aggregatedResults = [SELECT Account__c, COUNT(Id) totCount 
                                                   FROM Employee__c 
                                                   WHERE Account__c IN :accIds 
                                                   GROUP BY Account__c];
        //System.debug('Size Is: '+aggregatedResults.size());
        List<Account> updatedAcctList = new List<Account>();
        for(AggregateResult ar : aggregatedResults){
            Id accountId = (Id) ar.get('Account__C');
            Account newAcc = new Account(Id = accountId);
            Decimal totalChildCount = (Decimal) ar.get('totCount'); 
            newAcc.Related_Employee_Count__c = totalChildCount;
            updatedAcctList.add(newAcc);
        }
        if(!updatedAcctList.isEmpty()){
            update updatedAcctList;
        }
    }
}