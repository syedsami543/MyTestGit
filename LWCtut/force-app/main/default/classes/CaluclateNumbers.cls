public with sharing class CaluclateNumbers {
    public CaluclateNumbers() {
    }
    @AuraEnabled
    public static integer getSumResult(integer firstnumber, integer secondnumber){
    integer i=(firstnumber+secondnumber);
    system.debug(i);
    return i;
    }
}