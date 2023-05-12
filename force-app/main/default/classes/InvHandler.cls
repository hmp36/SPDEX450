public with sharing class InvHandler {

    // method to create entries in the invoice__Share table to share the invoice records
    public static void shareInvoices(List<Invoice__C> invoices) {
    
        List
         
        //Map to hold the Opp owner ID for each Opp Id 
        Map<Id> oppIds =new Set<Id>();

         //variable to hold the ID for the SVP Customer Service
         Id SVP;
        
         // get the Opp IDs from the the list of Invoice records
         for (Invoice__C inv : invoices) {
             oppIds.add(inv.Opportunity__c);                        //add the Opp ID to the set

         // get the Owner's ID and add it to my map of Opp Owners 
         for (Opportunity o : [SELECT Id, OwnerId FROM Opportunity WHERE Id IN :oppIds])   {
             mapOppOwners.put(o.Id, o.OwnerId);
         }
         

         // get the role ID for the SVP of Customer Service

         Group g = [SELECT Id, DeveloperName FROM Group WHERE DeveloperName = 'SVPCustomerServiceSupportA' LIMIT 1 ];
         SVP = g.Id;

        //create the share records for the Invoices and insert them into the database
        for (Invoice__c inv : invoices) {
            Invoice__share invShare = new Invoice__Share();
            invShare.ParentId       = inv.Id;
            invShare.UserOrGroupId  = mappOppOwners.get(inv.Opportunity__c);
            invShare.AccessLevel    = 'Edit';
            invShare.RowCause       = 'Manual';

            shares.add(invShare);

            //share record for SVP
            invShare = new Invoice__Share();
            invShare.ParentId             = inv.Id;
            invShare.UserOrGroupId        = SVP;
            invShare.AccessLevel          = 'Edit';
            invShare.RowCause             = 'Manual';

            shares.add(invShare);
        }

        List<Database.SaveResult> srs = Database.insert(shares, false);     // insert the share records into the database
        for (Database.SaveResult sr :srs ) {
            if (!sr.isSuccess()){
                for (Database.Error e : Sr.get Errors()) {
                    system.debug(e.getMessage());
                }
            }
        }
    
    }
        // method to check for an outstanding balance on Invoice record deletions
        public static void checkInvoiceDeletion(LIST<Invoice__C>){

        }






}