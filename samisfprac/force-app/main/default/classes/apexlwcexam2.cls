public with sharing class apexlwcexam2 {
    @AuraEnabled 
    public static list<contact> getContacts(string recordId) {
    List<contact> NL = [SELECT Email,Fax,FirstName,Id,LastName,Name,Phone FROM Contact where AccountId =:recordId];
    return NL;
    }
}
