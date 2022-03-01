import { LightningElement,track } from 'lwc';

export default class EmployeeInfo extends LightningElement {
    @track name;
    @track age;
    @track salary;
    @track show="true";

    namehandler(event){
        this.name=event.target.value;
    }
    agehandler(event){
        this.age=event.target.value;
    }
    salaryhandler(event){
        this.salary=event.target.value;
    }
    handlernext(event){
        this.show=false;
    }
    

}