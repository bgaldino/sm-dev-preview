#!/bin/sh

defaultDir="../sm/main";

echo "Pushing Permission Sets"
sfdx force:source:deploy -p $defaultDir/default/permissionsets

sfdx force:user:permset:assign --permsetname Revenue_Cloud_Pilot
sfdx force:user:permset:assign --permsetname CALM_PermSet_Do_not_Edit
sfdx force:user:permset:assign --permsetname CREATE_BILLINGSCHEDULE_API_DO_NOT_EDIT
sfdx force:user:permset:assign --permsetname CREATE_INVOICE_API_DO_NOT_EDIT
sfdx force:user:permset:assign --permsetname IA_ORDER_TO_ASSET_DO_NOT_TOUCH
sfdx force:user:permset:assign --permsetname IA_ORDER_ITEM_TO_BILLING_SCHEDULE_DO_NOT_TOUCH
sfdx force:user:permset:assign --permsetname Phoenix_BSGCancellationAPI_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_BuyNow_Admin_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_BuyNow_User_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_CalculatePriceAPI_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_CreateQuote
sfdx force:user:permset:assign --permsetname Phoenix_CreditMemoApiUser_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_CreditMemoApiUserRecordAccess_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_PaymentsPlatformAPIs_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_PaymentsPlatformCRUD_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_PaymentsPlatformSetup_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_PearCancel_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_PearRenew_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_PlaceOrder_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_ProductAndPriceConfig_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_QuoteToOrderAdmin_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_QuoteToOrderUser_DONOTEDIT
sfdx force:user:permset:assign --permsetname Phoenix_SBP_AR_Ops_User_Do_Not_Edit
sfdx force:user:permset:assign --permsetname Phoenix_SBP_User_Do_Not_Edit
sfdx force:user:permset:assign --permsetname Phoenix_TaxApp_API_admin_DO_NOT_EDIT
sfdx force:user:permset:assign --permsetname Phoenix_TaxApp_API_user_DO_NOT_EDIT

echo "All operations completed"