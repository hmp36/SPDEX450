import { LightningElement, wire } from 'lwc';
import getTopAccounts from '@salesforce/apex/accountController.getTopaccounts';

export default class AcctList extends LightningElement {

    records;                //property to hold the account records returned

    @wire(getTopAccounts)
    wiredAccount({data, error}){
        if (data)  {
            this
        }
        if (error) {
            console.log('error')
        }
    }
}