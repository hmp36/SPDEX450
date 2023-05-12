import { LightningElement } from 'lwc';

export default class OppRecordForm extends LightningElement {

    formLabel = 'Opp Record Form';

    // two special public properties that will inherit the record context from the record page 
    @api recordId;
    @api objectApiName;

    @api formMode = 'readonly';
    @api layoutType = 'compact';

    // Method to handle the cancel event from the lightning-record-page-form
    handleCancel(){
        const myEvent = new CustomEvent('cancel');
         

    }


}