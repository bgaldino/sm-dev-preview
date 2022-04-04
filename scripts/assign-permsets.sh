#!/bin/sh
apiVersion="55.0";

function echo_attention() {
  local green='\033[0;32m'
  local no_color='\033[0m'
  echo "${green}$1${no_color}"
}

sfdx force:user:permsetlicense:assign -n RevSubscriptionManagementPsl

sfdx force:user:permset:assign -n SubscriptionManagementBillingAdmin
sfdx force:user:permset:assign -n SubscriptionManagementBillingOperations
sfdx force:user:permset:assign -n SubscriptionManagementBuyerIntegrationUser
sfdx force:user:permset:assign -n SubscriptionManagementCollections
sfdx force:user:permset:assign -n SubscriptionManagementCreditMemoAdjustmentsOperations
sfdx force:user:permset:assign -n SubscriptionManagementPaymentAdministrator
sfdx force:user:permset:assign -n SubscriptionManagementPaymentOperations
sfdx force:user:permset:assign -n SubscriptionManagementProductAndPricingAdmin
sfdx force:user:permset:assign -n SubscriptionManagementSalesOperationsRep
sfdx force:user:permset:assign -n SubscriptionManagementTaxAdmin