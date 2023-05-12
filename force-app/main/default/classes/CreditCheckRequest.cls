global class CreditCheckRequest {

    //method that takes an account ID as a parameterand makes a callout to an external endpoint
    public static void callCreditCheckApi(String accountId) {

        // query the database to retrieve Account information for the parameters
        Account acct = [SELECT Id, Name, Owner.Email FROM Account WHERE Id = accountId LIMIT 1];

        // create a url for my endpoint with the required parameters
        String url = 'https://splx201-developer-edition.na124.force.com/creditcheck';

        //  append my parameter to the url
        url += '?name=' + EncodingUtil.urlEncode(acct.Name, 'UTF-8')
            + '&email=' + acct.Owner.Email
            + '&requestor' + EncodingUtil.urlEncode(acct.Owner.Name, 'UTF-8');

         system.debug(url);
         
         //  create an instance of HTTP, HTTPRequest


    }
}
