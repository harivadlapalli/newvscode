import { LightningElement, track, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';
import getContactsByAccountId from '@salesforce/apex/ContactController.getContactsByAccountId';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

const accountColumns = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    {
        label: 'View Contacts', type: 'button', typeAttributes: {
            label: 'View Contacts',
            name: 'view_contacts',
            variant: 'base',
            target: '_self'
        }
    }
];

const contactColumns = [
    { label: 'Contact Name', fieldName: 'Name', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' }
];

export default class AccountList extends LightningElement {
    @track accounts;
    @track contacts;
    @track selectedAccountId;
    @track showContacts = false;
    @track selectedAccountIds = [];
    @track isDeleteModalOpen = false;
    wiredAccountsResult;

    accountColumns = accountColumns;
    contactColumns = contactColumns;

    @wire(getAccountList)
    wiredAccounts(result) {
        this.wiredAccountsResult = result;
        if (result.data) {
            this.accounts = result.data;
        } else if (result.error) {
            this.showToast('Error', 'Error retrieving accounts', 'error');
        }
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'view_contacts') {
            this.selectedAccountId = row.Id;
            this.fetchContacts();
        }
    }

    fetchContacts() {
        getContactsByAccountId({ accountId: this.selectedAccountId })
            .then(result => {
                this.contacts = result;
                this.showContacts = true;
            })
            .catch(error => {
                this.showToast('Error', 'Error retrieving contacts', 'error');
                this.showContacts = false;
                console.error('Error retrieving contacts: ', error);
            });
    }

    showToast(title, message, variant) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(evt);
    }

    handleRowSelection(event) {
        const selectedRows = event.detail.selectedRows;
        this.selectedAccountIds = selectedRows.map(row => row.Id);
    }

    handleDelete() {
        if (this.selectedAccountIds.length === 0) {
            this.showToast('Warning', 'Please select at least one account to delete.', 'warning');
            return;
        }
        this.isDeleteModalOpen = true;
    }

    closeDeleteModal() {
        this.isDeleteModalOpen = false;
    }

    confirmDelete() {
        this.isDeleteModalOpen = false;
        Promise.all(this.selectedAccountIds.map(accountId =>
            deleteRecord(accountId)
        ))
        .then(() => {
            this.showToast('Success', 'Account(s) deleted successfully', 'success');
            return refreshApex(this.wiredAccountsResult);
        })
        .catch(error => {
            this.showToast('Error', 'Error deleting account(s)', 'error');
            console.error('Error deleting account: ', error);
        });
        this.selectedAccountIds = [];
    }

    handleCloseContacts() {
        this.showContacts = false;
    }
}
