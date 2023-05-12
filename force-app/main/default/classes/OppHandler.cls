public with sharing class OppHandler {

    // method to update Opp Names to match the naming convention 
    public static void updateOppName(List<Opportunity> opps) {


        // set to hold the related Account record IDs
        Set<Id> acctIds = new Set<Id>();
    
        for (Opportunity opp : opps) {
                                         
            opp.Name = opp.AcctNames.get(opp.AccountId) + '-' + opp.Type + '-' + opp.CloseDate.year() + '/' + opp.CloseDate.month();
        }
    }
    //method to create invoice records from a new opportunity that is closed-won
    public static void createInvoiceFromOpp(List<Opportunity> opps, Map<Id, Opportunity>OldOpps)  {

        //create a list to hold my new invoices to be created
        List<Invoice_c> invToCreate = new List<Invoice__c>();

        // iterate over the records and check the stage for Closed-Won
        for (Opportunity opp : opps) {
            if (opp.IsWon){
                Invoice__c inv          = new Invoice__c();
                inv.Account__c          = app.AccountId;
                inv.Opportunity__c      = opp.Id;
                inv.Billing_Contact__c  = opp.ContactId;
                inv.Amount__c           = opp.Amount;
                inv.Due_Date__c         = opp.CloseDate + 30;

                invToCreate.add(inv);

            }
        }
       //  check to see if I have invoices, and if so, insert them into the database
       if (!invToCreate.isEmpty()) {
           Database.insert(invToCreate, false);    
       }
    }
}