public with sharing class AccountController {

    // method to return a list of account records for use in an lwc
    @AuraEnabled()
    public static List<Account> getTopAccounts() {
       List<Account> accts = [SELECT Id, Name, AnnualRevenue, ]
    }
}
