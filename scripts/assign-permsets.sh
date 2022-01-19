#!/bin/sh

defaultDir="../sm/main";
sfdx force:source:deploy -p $defaultDir/default/classes/MockAdapter.cls
sfdx force:source:deploy -p $defaultDir/default/classes/SalesforceValidationException.cls
sfdx force:source:deploy -p $defaultDir/default/classes/SalesforceAdapter.cls

sfdx force:source:deploy -p $defaultDir/default/permissionsets

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