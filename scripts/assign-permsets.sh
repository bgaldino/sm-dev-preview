#!/bin/sh

function echo_attention() {
  local green='\033[0;32m'
  local no_color='\033[0m'
  echo "${green}$1${no_color}"
}

defaultDir="../sm/main";
sfdx force:source:deploy -p $defaultDir/default/classes/MockAdapter.cls --apiversion=54.0
sfdx force:source:deploy -p $defaultDir/default/classes/SalesforceValidationException.cls --apiversion=54.0
sfdx force:source:deploy -p $defaultDir/default/classes/SalesforceAdapter.cls --apiversion=54.0

sfdx force:source:deploy -p $defaultDir/default/permissionsets --apiversion=54.0

sfdx force:user:permset:assign --permsetname Revenue_Cloud_Pilot
sfdx force:user:permset:assign --permsetname CALM
sfdx force:user:permset:assign --permsetname Billing_Invoicing_API
sfdx force:user:permset:assign --permsetname CreateInvoice
sfdx force:user:permset:assign --permsetname OrderToAssetIA
sfdx force:user:permset:assign --permsetname OrderItemToInvoiceIA
sfdx force:user:permset:assign --permsetname BSGCancellationAPI
sfdx force:user:permset:assign --permsetname BuyNow_Admin
sfdx force:user:permset:assign --permsetname BuyNow_User
sfdx force:user:permset:assign --permsetname CalculatePrice_API
sfdx force:user:permset:assign --permsetname CreateQuote
sfdx force:user:permset:assign --permsetname CreditMemoApiUser
sfdx force:user:permset:assign --permsetname CreditMemoApiUserRecordAccess
sfdx force:user:permset:assign --permsetname PaymentsPlatformApiUser
sfdx force:user:permset:assign --permsetname PaymentsPlatformRecordAccess
sfdx force:user:permset:assign --permsetname PaymentsPlatformSetup
sfdx force:user:permset:assign --permsetname PearCancel
sfdx force:user:permset:assign --permsetname PearRenew
sfdx force:user:permset:assign --permsetname PlaceOrder
sfdx force:user:permset:assign --permsetname ProductAndPriceConfig
sfdx force:user:permset:assign --permsetname QuoteToOrder_Admin
sfdx force:user:permset:assign --permsetname QuoteToOrder_User
sfdx force:user:permset:assign --permsetname SBP_AR_Ops_User
sfdx force:user:permset:assign --permsetname SBP_User
sfdx force:user:permset:assign --permsetname TaxApp_API_Admin
sfdx force:user:permset:assign --permsetname TaxApp_API_User
sfdx force:user:permset:assign --permsetname ActivateOrders
sfdx force:user:permset:assign --permsetname CreateCancellationOrder

sfdx force:source:deploy -p $defaultDir/default/namedCredentials/Salesforce.namedCredential-meta.xml --apiversion=54.0

ncid=`sfdx force:data:soql:query -q "SELECT Id FROM NamedCredential WHERE MasterLabel='Salesforce' LIMIT 1" -r csv | tail -n +2`
echo_attention ncid=$ncid

sfdx force:source:deploy -p $defaultDir/default/paymentGatewayProviders/SalesforceGatewayProvider.paymentGatewayProvider-meta.xml --apiversion=54.0