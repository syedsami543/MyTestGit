public with sharing class CaluclateArea {
    @AuraEnabled
    public static decimal circleArea(decimal radius) {
        decimal area;
        area=(3.14)*radius*radius;
        return area;
    }
    @AuraEnabled 
    public static decimal rectangleArea(decimal length, decimal breadth) {
        decimal area;
        area=length*breadth;
        return area;
    }
    @AuraEnabled
    public static decimal squareArea(decimal side) {
            decimal area;
            area=side*side;
            return area;
    }
    
}
