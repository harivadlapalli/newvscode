public class GeethaDemo2 {
    public static void demoMethod(){
        Id loggeduser = Userinfo.getuserId();
        System.debug(loggeduser+'User Name:'+Userinfo.getuserName());
    }
}