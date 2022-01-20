public class CancelAssetController {
    @AuraEnabled
    public static String cancelAssetOnDate(Id assetId, DateTime cancelDate){
    //test
        // namedCredential should match the name of your named credential from Setup
        String namedCredential = 'Salesforce1';
        String restApiUrl = 'callout:' + namedCredential + '/services/data/v54.0/asset-management/assets/collection/actions/initiate-cancellation';  
        
        String formattedCancelDate = cancelDate.format('yyyy-MM-dd\'T\'HH:mm:ssXXX');
        
        String bodyJson = '{"assetIds": {"assetIdArray": ["' + assetId + '"]}, "cancellationDate": "' + formattedCancelDate + '", "cancellationOutputType": "order"}';
        System.debug('bodyJson: ' + bodyJson);
        
        HttpRequest httpRequest = new HttpRequest();  
        httpRequest.setMethod('POST');   
        httpRequest.setHeader('Content-Type', 'application/json;charset=UTF-8'); 
        httpRequest.setEndpoint(restApiUrl);  
        httpRequest.setBody(bodyJson);
        String response = '';
        try {  
            HttpResponse httpResponse = new Http().send(httpRequest);  
            while(httpResponse.getStatusCode() == 302) {
                httpRequest.setEndpoint(httpResponse.getHeader('Location'));
                httpResponse = new Http().send(httpRequest);
            }
            response = httpResponse.getBody();
        } catch(System.Exception e) {  
            System.debug('ERROR: ' + e);  
            throw e;  
        }  

        return response;
    }
}