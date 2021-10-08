# sm-dev-preview
Salesforce Subscription Management Developer Preview

This repository contains setup scripts, reference implementations and initial data to help quickly configure a fully functional, E2E Salesforce Subscription Management environment as part of the Developer Preview program.

This repository is currently limited to Salesforce Core Winter '22 (234) environments.  There are changes in Spring '22 (236) that will require significant modifications to licensing and provisioning, so any environment created during the developer preview period will not properly function upon the release of Spring '22 and therefore should be discarded at that time.

There will be new environments available once Spring '22 is released, so it is recommended that you plan your development and deployment process accordingly.

INSTRUCTIONS

Upon receipt and after confirming access to your developer preview environment, you can run the setup.sh script in the scripts directory to push the source, data, and will set up a mock payment gateway and tax provider.