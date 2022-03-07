import { LightningElement,api,track } from 'lwc';
import getContacts from '@salesforce/apex/apexlwcexam2.getContacts';

export default class Apexlwcexam2 extends LightningElement {
    @api recordId;
    @track columns =[
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'text'},
        {label:'Industry',fieldName:'Industry',type:'text'}
    ]
    connectedCallback(){
        getAccount()
            .then(result=>{
                this.accountRecords = result;
                console.log(accountRecords);
            })
            .catch(error=>{
                this.errors = error;
            })
    }    
}