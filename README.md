# **Salesforce Subscription Management Customer Pilot**

This repository contains setup scripts, reference implementations and initial data to help quickly configure a fully functional, E2E Salesforce Subscription Management environment as part of the Customer Pilot program.

This repository is currently limited to **Salesforce Core Spring '22 (236)** environments.  There are changes in Summer '22 (238) that may require significant modifications to licensing and provisioning, so any environment created during the developer preview period may not properly function upon the release of Summer '22 and therefore should be discarded at that time.

### **The Summer '22 (238) release of Salesforce Subscription Management will be the Generally Available (GA) version.**

There will be new environments available once Summer '22 is released, so it is recommended that you plan your development and deployment process accordingly.

### **INSTRUCTIONS**

**It is necessary to have Salesforce DX, Visual Studio Code, Git and the Salesforce Extensions for Visual Studio Code installed to proceed.**

You can also use other tools, such as IlluminatedCloud for IntelliJ IDEA, but that is beyond the scope of this document.

Salesforce DX CLI can be downloaded [here](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm).     There are setup instructions on the download site.

Visual Studio Code can be downloaded [here](https://code.visualstudio.com/download). There are also instructions on the VS Code site.

Salesforce Extensions for Visual Studio Code can be downloaded [here](https://developer.salesforce.com/tools/vscode).  There are instructions for setting it up in VS Code.

Git can be downloaded [here](https://git-scm.com/downloads).  There are instructions on the site.  For mac users, the easiest way to get git is to install XCode from the AppStore, launch it and click the button to confirm installation of helper tools. Instructions are [here](https://www.freecodecamp.org/news/install-xcode-command-line-tools/).

Upon receipt and after confirming access to your customer preview environment, you can run the **setup.sh** script in the scripts directory to push the sample source, metadata and data, and will also set up a mock payment gateway.  After successful completion of the setup scripts, you will be able to use the published postman collection to access the org to validate your setup.

These scripts set up two default connected apps for you to facilitate your setup of the collection.  Please reference the consumer key and secret from the **Postman** connected app in your org to use in your collection environment variables.