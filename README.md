# **Salesforce Subscription Management Customer Pilot**

Pilot Disclaimer

Subscription Management (including any API, documentation or material made available by SFDC for use with Subscription Management) (collectively, "Subscription Management") is not generally available and is being piloted with certain customers subject to and solely for evaluation purposes in accordance with the Salesforce Unified Pilot Research Agreement for this pilot. Subscription Management is Salesforce's Confidential Information and is not part of your purchased Services. Subscription Management is subject to change, may be discontinued without notice at any time in SFDC's sole discretion, and SFDC may never make Subscription Management generally available. Make your purchase decisions only on the basis of generally available products and features. Do not use Subscription Management with real data or in a production environment. Subscription Management is made available on an AS IS basis exclusive of any warranty or support, may contain bugs or errors, is provided solely for evaluation purposes, and is not intended for production use. Use of Subscription Management is at your sole risk. 

This repository contains setup scripts, reference implementations and initial data to help quickly configure a fully functional, E2E Salesforce Subscription Management environment as part of the Subscription Management Pilot.

This repository is currently limited to **Salesforce Core Spring '22 (236)** environments.  There are changes in Summer '22 (238) that may require significant modifications.

## **INSTRUCTIONS**

**It is necessary to have Salesforce DX, Visual Studio Code, Git and the Salesforce Extensions for Visual Studio Code installed to proceed.**

You can also use other tools, such as IlluminatedCloud for IntelliJ IDEA, but that is beyond the scope of this document.

Salesforce DX CLI can be downloaded [here](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm).     There are setup instructions on the download site.

Visual Studio Code can be downloaded [here](https://code.visualstudio.com/download). There are also instructions on the VS Code site.

Salesforce Extensions for Visual Studio Code can be downloaded [here](https://developer.salesforce.com/tools/vscode).  There are instructions for setting it up in VS Code.

Git can be downloaded [here](https://git-scm.com/downloads).  There are instructions on the site.  For mac users, the easiest way to get git is to install XCode from the AppStore, launch it and click the button to confirm installation of helper tools. Instructions are [here](https://www.freecodecamp.org/news/install-xcode-command-line-tools/).

Upon receipt and after confirming access to your customer preview environment, you can run the **setup.sh** script in the scripts directory to push the sample source, metadata and data, and will also set up a mock payment gateway.  After successful completion of the setup scripts, you will be able to use the published postman collection to access the org to validate your setup.

These scripts set up two default connected apps for you to facilitate your setup of the collection.  Please reference the consumer key and secret from the **Postman** connected app in your org to use in your collection environment variables.