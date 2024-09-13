public class CreateTaskOnOppo {
    public static void createTaskOnOppoMethod(List<Opportunity> oppList,Map<Id,Opportunity> oldMap){
        // Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>();
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : oppList){
            if(opp.StageName != oldMap.get(opp.id).StageName){
                Task t = new Task();
                t.WhatId = opp.Id;
                t.Subject = 'Email';
                t.Priority = 'Normal';
                t.status = 'Not Started';
                t.OwnerId = UserInfo.getUserId();
                taskList.add(t);
            }
        }
        if(taskList.size()>0){
            insert taskList;
        }
    }
}