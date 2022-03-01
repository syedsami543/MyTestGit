public class Json2Obj{
	public cls_attributes attributes;
	public String Id;	//0015g00000Gbu8fAAB
	public String Name;	//AXIS BNC
	public String Rating;	//Warm
	public String Phone;	//366845695
	public String Fax;	//987492344
	class cls_attributes {
		public String type;	//Account
		public String url;	///services/data/v54.0/sobjects/Account/0015g00000Gbu8fAAB
	}
	public static Json2Obj parse(String json){
		return (Json2Obj) System.JSON.deserialize(json, Json2Obj.class);
	}
}