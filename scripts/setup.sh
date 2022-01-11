#!/bin/sh

namedCredentialMasterLabel="Salesforce"
paymentGatewayAdapterName="SalesforceAdapter"
paymentGatewayProviderName="SalesforceGatewayProvider"
paymentGatewayName="MockGateway"
defaultDir="../sm/main";

function echo_attention() {
  local green='\033[0;32m'
  local no_color='\033[0m'
  echo "${green}$1${no_color}"
}

function error_and_exit() {
   echo "$1"
   exit 1
}

echo_attention "Pushing Permission Sets"
./assign-permsets.sh || error_and_exit "Permset Assignments Failed."

echo ""

echo_attention "Pushing Main Default to the Org. This will take few mins."
sf deploy metadata --source-dir $defaultDir --test-level RunLocalTests

echo ""

echo_attention "Pushing Data to the Org"
sfdx force:data:tree:import -p ../data/data-plan.json 

echo ""

apexClassId=`sfdx force:data:soql:query -q "SELECT Id FROM ApexClass WHERE Name='$paymentGatewayAdapterName' LIMIT 1" -r csv |tail -n +2`

# Creating Payment Gateway
echo_attention "Creating Payment Gateway"
paymentGatewayProviderId=`sfdx force:data:soql:query -q "SELECT Id FROM PaymentGatewayProvider WHERE DeveloperName='$paymentGatewayProviderName' LIMIT 1" -r csv | tail -n +2`
namedCredentialId=`sfdx force:data:soql:query -q "SELECT Id FROM NamedCredential WHERE MasterLabel='$namedCredentialMasterLabel' LIMIT 1" -r csv | tail -n +2`

echo ""

echo_attention "Creating PaymentGateway record using MerchantCredentialId=$namedCredentialId, PaymentGatewayProviderId=$paymentGatewayProviderId."

echo ""

sfdx force:data:record:create -s PaymentGateway -v "MerchantCredentialId=$namedCredentialId PaymentGatewayName=$paymentGatewayName PaymentGatewayProviderId=$paymentGatewayProviderId Status=Active"

echo_attention "All operations completed"