public with sharing class apexlwcexam2 {
    @AuraEnabled 
    public static list<contatc> getContacts(string accid) {
    List<contact> NL = [select id, name, phone, fax, industry from contact where account id in:accid];
    return NL;
    }
}
