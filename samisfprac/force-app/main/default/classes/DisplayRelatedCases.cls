public class DisplayRelatedCases {
    public static list<case> displayRelatedCases(id recordId){
        List<case> cs = [select id,subject,origin,description from case where accountid =:recordId];
        return cs;
    }

}