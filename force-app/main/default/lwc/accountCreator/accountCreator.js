import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import Name from '@salesforce/schema/Account.Name';
import AnnualRevenue from '@salesforce/schema/Account.AnnualRevenue';
import Industry from '@salesforce/schema/Account.Industry';

export default class AccountCreater extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;
    fields = [Name,AnnualRevenue,Industry];
    handleSuccess(event){
        const toastEvent = new ShowToastEvent({
            title : "Account Created",
            message : "Record Id:"+event.detail.id,
            variant : "Success"
        });
        this.dispatchEvent(toastEvent);
    }
}