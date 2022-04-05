#!/bin/sh
apiVersion="55.0";

function echo_attention() {
  local green='\033[0;32m'
  local no_color='\033[0m'
  echo "${green}$1${no_color}"
}

declare -a permissionSetGroups=("SubscriptionManagementBillingAdmin" 
                                "SubscriptionManagementBillingOperations" 
                                "SubscriptionManagementBuyerIntegrationUser" 
                                "SubscriptionManagementCollections" 
                                "SubscriptionManagementCreditMemoAdjustmentsOperations" 
                                "SubscriptionManagementPaymentAdministrator" 
                                "SubscriptionManagementPaymentOperations" 
                                "SubscriptionManagementProductAndPricingAdmin" 
                                "SubscriptionManagementSalesOperationsRep" 
                                "SubscriptionManagementTaxAdmin")

declare -a permissionSets=("SubscriptionManagementApplyCreditToInvoiceApi" 
                          "SubscriptionManagementBillingSetup" 
                          "SubscriptionManagementCalculateInvoiceLatePaymentRiskFeature" 
                          "SubscriptionManagementCalculatePricesApi" 
                          "SubscriptionManagementCalculateTaxesApi" 
                          "SubscriptionManagementCreateBillingScheduleFromOrderItemApi" 
                          "SubscriptionManagementCreateInvoiceFromBillingScheduleApi" 
                          "SubscriptionManagementCreateInvoiceFromOrderApi" 
                          "SubscriptionManagementCreditAnInvoiceApi" 
                          "SubscriptionManagementCreditMemoRecoveryApi" 
                          "SubscriptionManagementInitiateCancellationApi" 
                          "SubscriptionManagementInitiateRenewalApi" 
                          "SubscriptionManagementInvoiceErrorRecoveryApi" 
                          "SubscriptionManagementIssueStandaloneCreditApi" 
                          "SubscriptionManagementOrderToAssetApi" 
                          "SubscriptionManagementPaymentsConfiguration" 
                          "SubscriptionManagementPaymentsRuntimeApi" 
                          "SubscriptionManagementPlaceOrderApi" 
                          "SubscriptionManagementProductAndPriceConfigurationApi" 
                          "SubscriptionManagementProductImportApi" 
                          "SubscriptionManagementScheduledBatchInvoicingApi" 
                          "SubscriptionManagementScheduledBatchPaymentsApi" 
                          "SubscriptionManagementTaxConfiguration" 
                          "SubscriptionManagementUnapplyCreditToInvoiceApi" 
                          "SubscriptionManagementVoidPostedInvoiceApi")

sfdx force:user:permsetlicense:assign -n RevSubscriptionManagementPsl

for i in "${permissionSets[@]}"
do
  sfdx force:user:permset:assign -n "$i"
done