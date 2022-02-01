global virtual class AvalaraAdapter implements commercetax.TaxEngineAdapter {

    global commercetax.TaxEngineResponse processRequest(commercetax.TaxEngineContext taxEngineContext) {
        commercetax.RequestType requestType = taxEngineContext.getRequestType();
        if(requestType == commercetax.RequestType.CalculateTax){
            return CalculateTaxService.getTax(taxEngineContext);
        }
        else 
            return null;
    }
}