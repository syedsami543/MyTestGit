public class DisplayRelatedContacts {
    @AuraEnabled
    public static list<Contact> displayrelatedcontacts(id accountid){
        list<Contact> con = [SELECT Id,FirstName,LastName,LeadSource FROM Contact WHERE AccountId = :accountid ORDER BY CreatedDate DESC LIMIT 5 ];
        system.debug(con);
        return con;    
    }

}