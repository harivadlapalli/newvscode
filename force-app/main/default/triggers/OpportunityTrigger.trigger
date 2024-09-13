trigger OpportunityTrigger on Opportunity (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if (Trigger.IsAfter){
        if((Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete)) {
            OpportunityHandler.updateAccountAnnualRevenue(Trigger.oldMap, Trigger.newMap, Trigger.isDelete);
        }
        if(Trigger.isUpdate){
            CreateTaskOnOppo.createTaskOnOppoMethod(Trigger.New,Trigger.oldMap);
        }
    } 
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            OppoDescUpdate.oppoDescUpdateMethod(Trigger.New);
        }
    }
}