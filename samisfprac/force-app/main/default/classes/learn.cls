public class learn {
    public void learnMethod(string param){
        List<Account> olilist1 = [select id,name,rating,phone,website  from account where name=:param];
system.debug(olilist1);
Map<id,string> olinumdetails = new Map<id,string>();  
for(account oli1 : olilist1){
olinumdetails.put(oli1.Id, oli1.rating);
    system.debug(olinumdetails);
    }
    }
}