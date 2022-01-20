public class bsgToInvoiceController {
    
     @AuraEnabled
    public static String bsgToInvoice(Id orderId){
        // namedCredential should match the name of your named credential from Setup
        String namedCredential = 'Salesforce1';
        String restApiUrl = 'callout:' + namedCredential + '/services/data/v54.0/commerce/billing/invoices';  
        BillingSchedule bs1;
        BillingSchedule bs2;
		
        System.debug('OrderId: ' + orderId);
		List<BillingSchedule> bsg = [Select BillingScheduleGroupId FROM BillingSchedule WHERE ReferenceEntityId = :orderId];
        System.debug('bsg: ' + bsg);
        System.debug(1);
		List<BillingSchedule> listOfBS = [Select Id, NextBillingDate, NextChargeFromDate From BillingSchedule WHERE BillingScheduleGroupId = :bsg.get(0).BillingScheduleGroupId];
        bs1 = listOfBS.get(0);
        //bs2 = listOfBS.get(1);
        System.debug('bsg nextBillingDate: ' + bs1.NextBillingDate);
        System.debug('bsg nextChargeFromDate: ' + bs1.NextChargeFromDate);

        DateTime nextBillingDateDT = bs1.NextBillingDate;

        String nextBillingDate = nextBillingDateDT.format('yyyy-MM-dd\'T\'HH:mm:ss.SSSZ');
        System.debug('nextBillingDate string: ' + nextBillingDate);

        
        //String bodyJson1 = '{"inputs": [{"orderId": "' + orderId + '"}]}';
        //String bodyJson =  '{"billingScheduleIds":["' +  bs1.Id + '","' + bs2.Id + '"],' +
/*         String bodyJson =  '{"billingScheduleIds":["' +  bs1.Id + '"],' + 
                            '"action":"Posted",' +
                            '"targetDate":"2022-04-10T20:18:24.000Z",' +
                            '"invoiceDate":"2022-04-10T20:18:24.000Z"}'; */

        String bodyJson =  '{"billingScheduleIds":["' +  bs1.Id + '"],' + 
                            '"action":"Posted",' +
                            '"targetDate":"' + nextBillingDate + '",' +
                            '"invoiceDate":"' + nextBillingDate + '"}';
        
        System.debug('bodyJson: ' + bodyJson);
        
        HttpRequest httpRequest = new HttpRequest();  
        httpRequest.setMethod('POST');   
        httpRequest.setHeader('Content-Type', 'application/json;charset=UTF-8'); 
        httpRequest.setEndpoint(restApiUrl);  
        httpRequest.setBody(bodyJson);
        String response = '';
        try {  
            HttpResponse httpResponse = new Http().send(httpRequest);  
            System.debug('Response' + httpResponse);
            System.debug(httpResponse.getStatusCode());
            while(httpResponse.getStatusCode() == 302) {
                httpRequest.setEndpoint(httpResponse.getHeader('Location'));
                httpResponse = new Http().send(httpRequest);
            }
            response = httpResponse.getBody();
        } catch(System.Exception e) {  
            System.debug('ERROR: ' + e);  
            throw e;  
        }  
		System.debug(response);
        return response;
    }

}