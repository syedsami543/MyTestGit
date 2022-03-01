import { LightningElement,track } from 'lwc';
import getSumResult from '@salesforce/apex/CaluclateNumbers.getSumResult'
export default class DataCommunicationbtwLWCApex extends LightningElement {
    @track fnumber;
    @track snumber;
    @track sum;
    @track errors;
    handleClick(){
        getSumResult({firstnumber:this.fnumber,secondnumber:this.snumber})
        .then(result=>{
        this.sum=result;
        console.log(sum);
        })
        .catch(error=>{
        this.errors=error;
        });
    }
    handleChange(event){
        if(event.target.name==='fstnumber'){
            this.fnumber = event.target.value;
        }
        else if(event.target.name==='scdnumber'){
            this.snumber = event.target.value;
        }
    }
}