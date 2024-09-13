import { LightningElement, track, wire } from 'lwc';
import displayAcctNamesMethod from '@salesforce/apex/DisplayAcctNames.displayAcctNamesMethod';

export default class DisplayAcctNames extends LightningElement {
    @track accountNames;

    @wire(displayAcctNamesMethod) wiredAccounts({data, error}) {
        if(data) {
            this.accountNames = data;
        } else if(error) {
            console.error('Error happened: ' + error);
        }
    }
}