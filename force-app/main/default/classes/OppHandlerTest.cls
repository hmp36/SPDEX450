@isTest
private class OppHandlerTest {


    @isTest static void testOppNameChange() {

        Account acct = new Account();
        acctName = 'Test Account';
        insert acct;

        Opportunity opp = new Opportunity();
        opp.AccountId =acct.Id;
        opp.StageName = 'prospecting';
        opp.Amount = 1000;
        opp.CloseDate = Date.today();
        opp.Type = 'New Customer';

        insert opp;

        // retrieve opp and check name
        Opportunity o = [SELECT Name FROM Opportunity WHERE AccountId = :acct.Id LIMIT 1];

        String correct = 'Test Account-New Customer-' + opp.CloseDate.year() + '/' + opp.CloseDate.month();
        system.assert(o.Name == correct, 'Opp Name not updated correctly');

        opp.StageName = 'Closed Won';
        update opp;

        Invoice__c inv = [SELECT Id, Name FROM Invoice__c WHERE Opportunity__c = :opp.Id];
        system.assert(inv.Name != null, 'Invoice not created');
    }
}

