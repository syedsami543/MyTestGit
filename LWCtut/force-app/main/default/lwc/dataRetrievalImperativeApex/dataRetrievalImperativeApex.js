import { LightningElement,track } from 'lwc';
import gettAccountData from '@salesforce/apex/accountData.getAccountData';

export default class DataRetrievalImperativeApex extends LightningElement {
    @track accountRecords;
    @track errors;
    @track columns =[
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'text'},
        {label:'Industry',fieldName:'Industry',type:'text'}
    ]
    connectedCallback(){
        getAccountData()
            .then(result=>{
                this.accountRecords = result;
                console.log(accountRecords);
            })
            .catch(error=>{
                this.errors = error;
            })
    }
}