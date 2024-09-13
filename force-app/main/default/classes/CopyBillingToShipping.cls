public class CopyBillingToShipping {
    public static void copyBillingToShippingMethod(List<Account> accList) {
        for (Account acc : accList) {
            if (acc.CopyBillingToShipping__c == true&& 
                acc.BillingCity != null &&
                acc.BillingCountry != null &&
                acc.BillingPostalCode != null &&
                acc.BillingState != null && 
                acc.BillingStreet != null) {
                
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet = acc.BillingStreet;
            }
        }
    }
}