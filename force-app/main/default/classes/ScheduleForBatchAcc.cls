global class ScheduleForBatchAcc implements Schedulable {
   global void execute(SchedulableContext SC) {
      Database.executeBatch(new BatchToUpdateOppCountInAcct(), 2000); 
   }
    
    /*String croneExpression = '0,0,22,*,*,?';
    String jobId = system.schedule('Every Day 10 PM',croneExpression,new ScheduleForBatchAcc());*/
}