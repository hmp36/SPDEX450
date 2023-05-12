global class UpdateOpportunitiesBatch implements Database.Batchable<sObject> {

    //define the state method to collect the records
    global Database.Querylocator start (Database.BatchableContext bc) {
        // return the list of Opp records using the getQueryLocator method
        return Database.getQueryLocator('SELECT Id, Name, Account.Name, CloseDate FROM Opportunity'); 
    }
    
    //define the execute method
    global void execute (Database.BatchableContext bc, List<Opportunity> opps) {
        List<Opportunity> oppsForUpdate = new List<Opportunity>();

        for (Opportunity o : opps){
       // o.Name = o.Account.Name + '-' + o.Type + '-' o.closeDate.year()
          oppsForUpdate.add(o);    
    }
       
        update oppsForUpdate;
    }
    //define the finish method, for post-processing logic
    global void finish (Database.BatchableContext bc) {
        system.debug('Finish method');

        // retrieve job ID for the batch process
        AsyncApexJob job = [SELECT Id, Status, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()];

        //create an email message 
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        Message.toAddresses = new String[] {job.CreatedBy.Email};
        message.subject = 'Async Job Infor for: ' + job.Id;
        message.plaintextbody = 'Job Status: ' + job.Status;

        //create a list of email message to be sent
        List<Messaging.SingleEailMessage> messages = new List<Messaging.SingleEmailMessage>();

        messages.add(message);

        //send email messages
        List<Messaging.SendEmailResult> results = Messaging.sendEmail(messages);

        if(results[0].success) {}




    }

}
