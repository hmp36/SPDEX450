global class UpdateAllOpportunities implements Schedulable {

    // implement the execute method to schedule a Batch Apex class to run 
    global void execute(SchedulableContext sc) {

        // any logic I want to execute when the scheduled class is invoked
        id batchId = Database.executeBatch(new UpdateOpportunitiesBatch());
        system.debug('Batch ID: ' + batchId);
    }
}

