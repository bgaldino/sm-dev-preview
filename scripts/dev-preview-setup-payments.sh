#!/bin/sh

# Use this command followed by a version (234, 236, etc).
#
# This script will set up all the required parts for using a new Payment Gateway
# - convert and push Named Credentials and Gateway Adapter apex to the org 
# - create a Payment Gateway Provider record
# - create a Payment Gateway record
#

function prompt_for_gateway {
    echo "Payment Gateway Adapter options:"
    echo "[0] Salesforce Mock Gateway"
#    echo "[1] Payeezy"
#    echo "[2] Stripe"
    read -p "Please enter the Gateway you would like to set up > " selectedAdapter
}

if [ -z "$1" ]
then
    echo "You need to specify a target Salesforce release version (232, 234, 236)."
else
    while [[ ! $selectedAdapter =~ 0|1|2 ]]; do
        prompt_for_gateway
    done

    case $selectedAdapter in
    0)
        selection="Salesforce"
        ;;
    1)
        selection="Payeezy"
        ;;
    2)
        selection="Stripe"
        ;;
    esac

    namedCredentialMasterLabel=$selection
    paymentGatewayAdapterName="${selection}Adapter"
    paymentGatewayProviderName="${selection}PGP"
    paymentGatewayName="${selection}PG"
    examplesDir="../sm/main";

    echo "Setting up $selection Gateway"

    #echo "Converting Named Credentials and Gateway Adapter Apex for SFDX use..."
    #sfdx force:mdapi:convert -r $examplesDir
    echo "Pushing Named Credentials and Gateway Adapter Apex to org..."
    #sfdx force:source:push -f
    sfdx force:source:deploy -p $examplesDir
    # Creating Payment Gateway Provider
    apexClassId=`sfdx force:data:soql:query -q "SELECT Id FROM ApexClass WHERE Name='$paymentGatewayAdapterName' LIMIT 1" -r csv |tail -n +2`
    echo "Creating PaymentGatewayProvider record using ApexAdapterId=$apexClassId."
    sfdx force:data:record:create -s PaymentGatewayProvider -v "DeveloperName=$paymentGatewayProviderName ApexAdapterId=$apexClassId MasterLabel=$paymentGatewayProviderName IdempotencySupported=Yes Comments=Comments"

    # Creating Payment Gateway
    paymentGatewayProviderId=`sfdx force:data:soql:query -q "SELECT Id FROM PaymentGatewayProvider WHERE DeveloperName='$paymentGatewayProviderName' LIMIT 1" -r csv | tail -n +2`
    namedCredentialId=`sfdx force:data:soql:query -q "SELECT Id FROM NamedCredential WHERE MasterLabel='$namedCredentialMasterLabel' LIMIT 1" -r csv | tail -n +2`
    echo "Creating PaymentGateway record using MerchantCredentialId=$namedCredentialId, PaymentGatewayProviderId=$paymentGatewayProviderId."
    sfdx force:data:record:create -s PaymentGateway -v "MerchantCredentialId=$namedCredentialId PaymentGatewayName=$paymentGatewayName PaymentGatewayProviderId=$paymentGatewayProviderId Status=Active"

    namedCredentialId=`sfdx force:data:soql:query -q "SELECT Id FROM NamedCredential WHERE MasterLabel='$namedCredentialMasterLabel' LIMIT 1" -r csv | tail -n +2`
    echo "A Named Credential has been set up for you.  Please update it to use a valid username and password."
    read -p "Press [Enter/Return] to continue ..."
   
    sfdx force:org:open -p lightning/setup/NamedCredential/page?address=%2F$namedCredentialId
fi
