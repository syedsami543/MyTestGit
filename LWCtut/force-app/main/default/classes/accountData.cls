public with sharing class accountData {
    @AuraEnabled
    public static List<Account> getAccountData() {
        return [SELECT Id,Industry,Name FROM Account WHERE OwnerId = '0055g00000BBIf1AAH' LIMIT 10];
    }
}