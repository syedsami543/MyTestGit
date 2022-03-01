public class obtojson {
    public static string Json(){
        Account acc = [select id,name,rating,phone,fax from account where id='0015g00000Gbu8fAAB'];
        system.debug(acc);
		String str = JSON.serialize(acc);
        system.debug(str);
        return str;
    }

}