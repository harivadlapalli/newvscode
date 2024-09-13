public class PermissionSetHelper {

    /**
     * Retrieves the permission sets assigned to users with the specified profile.
     *
     * @param profileName Name of the profile to search for (e.g., 'System Administrator')
     */
    public static void getPermissionSetsByProfile(String profileName) {
        // Step 1: Query Users with the specified profile to get User IDs
        List<User> usersWithProfile = [SELECT Id FROM User WHERE Profile.Name = :profileName];

        // Extract User IDs
        Set<Id> userIds = new Set<Id>();
        for (User user : usersWithProfile) {
            userIds.add(user.Id);
        }

        // Step 2: Query PermissionSetAssignments to get Permission Set Names
        if (!userIds.isEmpty()) {
            List<PermissionSetAssignment> assignments = [SELECT PermissionSet.Name 
                                                        FROM PermissionSetAssignment 
                                                        WHERE AssigneeId IN :userIds];

            // Output Permission Set Names
            Set<String> permissionSetNames = new Set<String>();
            for (PermissionSetAssignment assignment : assignments) {
                permissionSetNames.add(assignment.PermissionSet.Name);
            }

            // Print or return the Permission Set Names
            for (String name : permissionSetNames) {
                System.debug('Permission Set Name: ' + name);
            }
        } else {
            System.debug('No users found with profile: ' + profileName);
        }
    }
}