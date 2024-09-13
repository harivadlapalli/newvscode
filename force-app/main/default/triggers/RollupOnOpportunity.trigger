trigger RollupOnOpportunity on Opportunity (after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete){
            RollupOnOpportunityHandler.rollupOnOpportunityMethod(Trigger.new, Trigger.oldMap);
        }
    }
}