trigger OppMasterTrigger on Opportunity (
    before insert, after insert,
    before update, after update,
    before delete, after delete, after undelete) {

    // check to see if it's a before event 
    if (trigger.isBefore) {
       //before insert
       if(trigger.isInsert)
       //log for an insert
    }
    if (trigger.isUpdate) {
          
        OppHandler.createInvoice
    }
    if (trigger.isDelete) {

    }
    //after delete
    if (trigger.isUndelete){
        //logic for undelete
    }
    //check to see if it's an after event
    if (trigger.isAfter){
    }
        //after insert
                 if (trigger.isInsert)  {
        // logic for an insert
        }

    }

}

