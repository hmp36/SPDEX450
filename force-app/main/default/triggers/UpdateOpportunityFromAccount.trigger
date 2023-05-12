trigger UpdateOpportunityFromAccount on Account(after update) {
    
    // create a Set to hold the Account IDs with name changes
    Set<Id> acctIds = new Set<Id>();

   // iterate over the new values of the updated records and check for name changes
   for (Account acct : trigger.new) {

       Account oldAcct =trigger.oldMap.get (acct.Id);
   
       // compare the new Name value against the old Name value to see if it changed
    }
   }








}