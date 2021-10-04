/* Purpose of this trigger to populate the TaxTreatment on OrderProduct
   Based on priority
   1. If the OrderProduct is associated to QuoteLineItem, and has TaxTreatment - Use this
   2. If the QuoteLineItem TaxTreatment is null, then get the TaxTreatment from Product2 via TaxPolicy TaxTreatment
   3. If the Product2 via TaxPolicy TaxTreatment is null, then get the random active TaxTreatment from org
   4. If we don't have any active TaxTreatment in org, we don't populate any value.

*/
trigger triggerOnOrderItem on OrderItem (before insert) {
    
    Set<Id> setofQuoteLineIds = new Set<Id>();
    Set<Id> setofProductIds = new Set<Id>();
    Map<Id, QuoteLineItem> mapOfQuoteLineItem = new Map<Id, QuoteLineItem>();
    Map<Id, Product2> mapOfProduct = new Map<Id, Product2>();
    
    
    List<TaxTreatment> listofTaxTreatment = [Select Id FROM TaxTreatment WHERE Status = 'Active' LIMIT 1];
    Id taxTreatmentId;
    if(!listofTaxTreatment.isEmpty()) {
        taxTreatmentId = listofTaxTreatment[0].Id;
    }
        
    for(OrderItem oi : trigger.new) {
        if(oi.QuoteLineItemId != NULL) {
            setofQuoteLineIds.add(oi.QuoteLineItemId);
        } if(oi.Product2Id != NULL) {
            setofProductIds.add(oi.Product2Id);
        } 
    }
    
    if(!setofQuoteLineIds.isEmpty() || !setofProductIds.isEmpty()) {
        mapOfQuoteLineItem = new Map<Id, QuoteLineItem>([Select Id, TaxTreatmentId FROM QuoteLineItem WHERE Id IN:setofQuoteLineIds]);
        mapOfProduct = new Map<Id, Product2>([Select Id, TaxPolicy.DefaultTaxTreatmentId FROM Product2 WHERE Id IN:setofProductIds]);
        
        for(OrderItem oi : trigger.new) {
            if(oi.QuoteLineItemId != NULL && mapOfQuoteLineItem.containskey(oi.QuoteLineItemId) 
                    && mapOfQuoteLineItem.get(oi.QuoteLineItemId).TaxTreatmentId != NULL) {
                oi.TaxTreatmentId = mapOfQuoteLineItem.get(oi.QuoteLineItemId).TaxTreatmentId;
            } else if(oi.Product2Id != NULL && mapOfProduct.containskey(oi.Product2Id) 
                    && mapOfProduct.get(oi.Product2Id).TaxPolicy.DefaultTaxTreatmentId != NULL) {
                oi.TaxTreatmentId = mapOfProduct.get(oi.Product2Id).TaxPolicy.DefaultTaxTreatmentId;
            } else if(oi.TaxTreatmentId == NULL) {
                oi.TaxTreatmentId = taxTreatmentId;
            }
        }
    }
}