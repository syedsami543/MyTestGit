public class getaccountrecords {
    public static List<account> getaccountrecordsmethod(string recordId){
        List<account> acc = [select id,name from account where id =:recordId limit 5];
        system.debug(acc);
        return acc;
        
    }
}