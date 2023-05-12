import { LightningElement } from 'lwc';

export default class FormToggle extends LightningElement {

    // public properties to inherit the record context from the record page 
@api recordId;
@api objectAPIname
    // private property to determine which mode to display the opp 
    editMode = false;

    get buttonLabel() {
        let mylabel;
        if (this.editMode) {
            mylabel = 'View';
        } else {
            mylabel = 'Edit';
        }
    }

}