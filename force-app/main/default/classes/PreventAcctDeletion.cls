public class PreventAcctDeletion {
    public static void preventAcctDeletionMethod(List<Account> accList){
        // Query to retrieve the System Administrator profile
        Profile p = [SELECT Id, Name FROM Profile WHERE Name = 'System Administrator'];
        
        // Check if the current user's profile is NOT the System Administrator profile
        if(UserInfo.getProfileId() != p.Id){
            for(Account acc : accList){
                // Add an error to prevent deletion for each account
                acc.addError('Only System Administrators can delete this record');
            }
        }
    }
}