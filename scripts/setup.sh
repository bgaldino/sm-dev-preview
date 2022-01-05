#!/bin/sh

namedCredentialMasterLabel="Salesforce"
paymentGatewayAdapterName="SalesforceAdapter"
paymentGatewayProviderName="SalesforceGatewayProvider"
paymentGatewayName="MockGateway"
defaultDir="../sm/main";

echo "Pushing Main Default to the Org. This will take few mins."
sfdx force:source:deploy -p $defaultDir

echo "Pushing Data to the Org"
sfdx force:data:tree:import -p ../data/data-plan.json 

apexClassId=`sfdx force:data:soql:query -q "SELECT Id FROM ApexClass WHERE Name='$paymentGatewayAdapterName' LIMIT 1" -r csv |tail -n +2`

# Creating Payment Gateway
echo "Creating Payment Gateway"
paymentGatewayProviderId=`sfdx force:data:soql:query -q "SELECT Id FROM PaymentGatewayProvider WHERE DeveloperName='$paymentGatewayProviderName' LIMIT 1" -r csv | tail -n +2`
namedCredentialId=`sfdx force:data:soql:query -q "SELECT Id FROM NamedCredential WHERE MasterLabel='$namedCredentialMasterLabel' LIMIT 1" -r csv | tail -n +2`
echo "Creating PaymentGateway record using MerchantCredentialId=$namedCredentialId, PaymentGatewayProviderId=$paymentGatewayProviderId."
sfdx force:data:record:create -s PaymentGateway -v "MerchantCredentialId=$namedCredentialId PaymentGatewayName=$paymentGatewayName PaymentGatewayProviderId=$paymentGatewayProviderId Status=Active"

echo "All operations completed"

