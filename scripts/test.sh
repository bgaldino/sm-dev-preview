#!/bin/sh
taxPolicyId=`sfdx force:data:soql:query -q "SELECT Id FROM TaxPolicy LIMIT 1" -r csv | tail -n +2`
echo $taxPolicyId

echo "Updating Tax Policy on Products"
products=`sfdx force:data:soql:query -q "SELECT Id FROM Product2" -r csv | tail -n +2`
for product in $products
do  
    sfdx force:data:record:update -s Product2 -i $product -v "TaxPolicyId=$taxPolicyId"
done

