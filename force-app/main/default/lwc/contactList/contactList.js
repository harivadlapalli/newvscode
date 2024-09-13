import { LightningElement, track, wire } from 'lwc';
import LastName from '@salesforce/schema/Contact.LastName';
import FirstName from '@salesforce/schema/Contact.FirstName';
import Email from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import { reduceErrors } from 'c/ldsUtils';

const COLUMNS =[{label : 'First Name', fieldName:FirstName.fieldApiName, type: 'text'},
    {label: 'Last Name', fieldName:LastName.fieldApiName, type:'text'},
    {label: 'Email',fieldName:Email.fieldApiName, type:'text'}
];

export default class ContactList extends LightningElement {
    @track contacts;
    //@track errors;
    columns = COLUMNS;

    @wire(getContacts)
    contacts;

    /*@wire(getContacts) wiredContacts({data,error}){
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }*/
    get errors(){
        return (this.contacts.error) ?
        reduceErrors(this.contacts.error) : [];
    }
}