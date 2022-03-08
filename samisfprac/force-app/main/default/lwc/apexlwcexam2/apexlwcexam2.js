import { LightningElement,api,track } from 'lwc';
import getContacts from '@salesforce/apex/apexlwcexam2.getContacts';

export default class Apexlwcexam2 extends LightningElement {
    @api recordId;
    contactRecords;
    @track columns =[
        {label:'Email',fieldName:'Email',type:'text',initialWidth: 34},
        {label:'Fax',fieldName:'Fax',type:'text',initialWidth: 34},
        {label:'FirstName',fieldName:'FirstName',type:'text',initialWidth: 34},
        {label:'LastName',fieldName:'LastName',type:'text'},
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'text'}
    ]
    connectedCallback(){
        getContacts({recordId:this.recordId})
            .then(result=>{
                this.contactRecords = result;
                console.log(contactRecords);
            })
            .catch(error=>{
                this.errors = error;
            })
    }    
}