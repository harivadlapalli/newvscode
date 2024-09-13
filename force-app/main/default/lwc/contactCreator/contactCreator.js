import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import LastName from '@salesforce/schema/Contact.LastName';
import FirstName from '@salesforce/schema/Contact.FirstName';
import Email from '@salesforce/schema/Contact.Email';
export default class ContactCreator extends LightningElement {
    objectApiName=CONTACT_OBJECT;
    fields=[LastName,FirstName,Email];

    handleSuccess(event){
        const toastEvent = new ShowToastEvent({
            title:"Contact Created",
            message : "Record Id: "+event.detail.id,
            variant : "success"
        });
        this.dispatchEvent(toastEvent);
    }
}