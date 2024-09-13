public class DescUpdate {
 // if rating field changed in account object ,description should be updated in contact object 
  public static void demoMethod(List<Account> accList, Map<Id,Account> oldMap){
      Set<Id> accIds = new Set<Id>();
      for(Account acc : accList){
          if(acc.Id == oldMap.get(acc.Id).Id && acc.Rating != oldMap.get(acc.Id).Rating){
              accIds.add(acc.Id);
          }
      }
      System.debug(accIds);
      List<Contact> conLIst = [select AccountId,Account.Rating from contact where AccountId IN: accIds];
      System.debug(conList);
      List<Contact> updatedContacts = new List<Contact>();
      for(Contact con : conLIst){
          con.Description ='Status Update with new Value : '+ con.Account.Rating +'And Old Value Is: '+ oldMap.get(con.AccountId).Rating;
          updatedContacts.add(con);
      }
      if(!updatedContacts.isEmpty()){
          update updatedContacts;
      }
  }
}