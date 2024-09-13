import { LightningElement, track, wire } from 'lwc';
import accountRecordsDisplay from '@salesforce/apex/AccountRecordsDisplay.accountRecordsDisplay';
import Name from '@salesforce/schema/Account.Name';
import Id from '@salesforce/schema/Account.Id';

const cols = [
    { label: 'Id', fieldName: Id.fieldApiName, type: 'text' },
    { label: 'Name', fieldName: Name.fieldApiName, type: 'text' }
];

export default class LwcMainComponent extends LightningElement {
    @track data;
    columns = cols;

    @wire(accountRecordsDisplay)
    displayRecords({ data, error }) {
        if (data) {
            this.data = data;
        } else if (error) {
            console.log('Error:', error);
        }
    }
}