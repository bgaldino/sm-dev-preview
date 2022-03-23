#!/bin/sh

defaultDir="../sm/main";
sfdx force:source:deploy -p $defaultDir/default/settings/Order.settings-meta.xml --apiversion=55.0
sfdx force:source:deploy -p $defaultDir/default/settings/Quote.settings-meta.xml --apiversion=55.0
sfdx force:source:deploy -p $defaultDir/default/classes/MockAdapter.cls --apiversion=55.0
sfdx force:source:deploy -p $defaultDir/default/classes/SalesforceValidationException.cls --apiversion=55.0
sfdx force:source:deploy -p $defaultDir/default/classes/SalesforceAdapter.cls --apiversion=55.0