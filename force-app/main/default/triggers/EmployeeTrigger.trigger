trigger EmployeeTrigger on Employee__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
           EmployeeCountOnAcct.employeeCountOnAcctMethod(Trigger.New); 
        }
    }
}