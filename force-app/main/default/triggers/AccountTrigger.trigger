trigger AccountTrigger on Account (before insert,before update,before delete,after insert,after update,after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            //DescUpdate.demoMethod(Trigger.new,Trigger.oldMap);
            //PnumUpdateOnRelatedRecords.pnumUpdateOnRelatedRecordsMethod(Trigger.new, Trigger.oldMap);
            // Way 1
            /*if(!PreventRecursion.firstCall){
                PreventRecursion.firstCall = true;
                RecursiveTriggerOnAcct.recursiveTriggerOnAcctMethod(Trigger.new);
            }*/
            
            //Way 2
            RecursiveTriggerOnAcct.recursiveTriggerOnAcctMethod(Trigger.new);
            
            //Way 3
            RecursiveTriggerOnAcct.recursiveTriggerOnAcctMethod(Trigger.new);
        }
        if(Trigger.isInsert){
            //ContactNOppoOnCheckBox.contactNOppoOnCheckBoxMethod(Trigger.New);
        }
    }
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
           //PapulateRating.papulateRatingMethod(Trigger.New);
           //CopyBillingToShipping.copyBillingToShippingMethod(Trigger.New);
           //PreventDuplicateEmailOnAcct.preventDuplicateEmailOnAcctMethod(Trigger.New);
        }
        if(Trigger.isUpdate){
            //PreventEditOfAcct.preventEditOfAcctMethod(Trigger.New);
            //RecursiveTriggerOnAccount.recursiveTriggerOnAccountMethod(Trigger.New);
        }
        if(Trigger.isDelete){
            //PreventAcctDeletion.preventAcctDeletionMethod(Trigger.New);
        }
    }
}