public class PreventRecursion {
	public static Boolean firstCall = false;
    public static Set<Id> processedRecords = new Set<Id>();
    public static Map<Id,Boolean> processedRecordsIds = new Map<Id,Boolean>();
}