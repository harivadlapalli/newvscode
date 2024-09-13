import { api, LightningElement, track, wire } from 'lwc';
import wrapperClassDemoMethod from '@salesforce/apex/WrapperClassDemo.wrapperClassDemoMethod';

export default class DisplayWrapperClassRecords extends LightningElement {
    @track accounts;

    @wire(wrapperClassDemoMethod)
    wiredAccounts({ data, error }) {
        console.log('Apex method called'); // Log to ensure method is called
        if (data) {
            console.log('Data received from Apex:', data); // Log the data received
            this.accounts = data;
            console.log('Accounts set:', this.accounts); // Log after setting accounts
        } else if (error) {
            console.error('Error received from Apex:', error); // Log any errors
        }
    }
}