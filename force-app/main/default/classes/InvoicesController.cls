public with sharing class InvoicesController {
   
    // private variable to hold the Opp Id from the current page 
    private Id oid;

    // private variable to hold the Opp record and it's values
    private Opportunity o;

    public InvoicesController(ApexPages.StandardController ssc) {
        //get the opp id from the record page


        //call a method to 



        //


















        







            //check to see if any invoices have an amount greater than 0, and if so, insert them into the database 
            List<Invoice__c> invoicesToCreate = new List <Invoice__c>();
        

            //create a Pagereference and return it
            pagereference pr = new Pagereference('/' + oid);
            return pr;         
    }
}
