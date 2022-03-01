import { LightningElement,track } from 'lwc';

export default class SimpleCaluclator extends LightningElement {
    @track  currentOutput;
    principal;
    rateOfInterest;
    noOfYears;
    principalHandler(event){
        this.principal=parseInt(event.target.value);
    }
    yearsHandler(event){
        this.rateOfInterest=parseInt(event.target.value);
    }
    interestHandler(event){
        this.noOfYears=parseInt(event.target.value);
    }
    caluclateHandler(event){
        this.currentOutput='Simple Interest is' +(this.principal*this.rateOfInterest*this.noOfYears)/100;
    }
}