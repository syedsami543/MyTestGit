public class GetLastFiveCaseRecords {
  @AuraEnabled
       public static List<case> getcaserecords(Id recordId){
        List<case> cs = [SELECT CaseNumber,ContactPhone,Description,Origin,Status,Subject FROM Case WHERE AccountId =:recordId ORDER BY CreatedDate ASC NULLS LAST LIMIT 4];
        system.debug(cs);
        return cs;
       
    }
}