import { api, LightningElement } from 'lwc';
import recordId from '@salesforce/schema/Account.AccountNumber'

export default class AccountViewForm extends LightningElement {
    @api recordId;
}