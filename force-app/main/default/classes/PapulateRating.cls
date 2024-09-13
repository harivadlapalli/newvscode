public class PapulateRating {
    public static void papulateRatingMethod(List<Account> accList){
        for(Account acc : accList){
            if(acc.Industry != null && acc.Industry=='Media'){
                acc.Rating = 'Hot';
            }
        }
    }
}