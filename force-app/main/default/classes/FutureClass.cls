public with sharing class FutureClass {
    public static void FutureAccountMethod(List<Id> ids) {

         List<Account> accounts = [SELECT Id, Name, Type FROM Account WHERE Id IN :ids];
         List<Account> acctsForUpdate = new List<Account>();

         For(Account a : accounts) {
             a.Type = 'Direct Customer';
             

         }
    }
}
