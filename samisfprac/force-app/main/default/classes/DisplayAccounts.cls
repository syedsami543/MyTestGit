public class DisplayAccounts {
    @AuraEnabled
    public static list<account> displayAccounts1(string param){
        string searchname = '%' +param+ '%';
        List<account> acc = [select id,Name,Rating,Phone from account where Name like : searchname];
        system.debug(acc);
        return acc;
    }
}