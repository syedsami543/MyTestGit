import { LightningElement, track, wire } from 'lwc';
import getAccounts from "@salesforce/apex/AccountController.getAccounts";

export default class DisplayDataUsingWire extends LightningElement {
    @track accdata;
    @wire(getAccounts)
    accountRecords({error,data}){
        console.log('Test LWC');
        if(data){
            this.accdata = data;
            console.log(this.accdata);
        }
        else if(error){
            this.data = undefined;
        }
    }
}