#!/bin/sh

function echo_attention() {
  local green='\033[0;32m'
  local no_color='\033[0m'
  echo "${green}$1${no_color}"
}

defaultDir="../sm/main";
sfdx force:source:deploy -p $defaultDir/default/settings/Order.settings-meta.xml --apiversion=55.0
sfdx force:source:deploy -p $defaultDir/default/settings/Quote.settings-meta.xml --apiversion=55.0
sfdx force:source:deploy -p $defaultDir/default/classes/MockAdapter.cls --apiversion=55.0
sfdx force:source:deploy -p $defaultDir/default/classes/SalesforceValidationException.cls --apiversion=55.0
sfdx force:source:deploy -p $defaultDir/default/classes/SalesforceAdapter.cls --apiversion=55.0