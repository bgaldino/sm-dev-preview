# **Salesforce Subscription Management Customer Pilot**

This repository contains setup scripts, reference implementations and initial data to help quickly configure a fully functional, E2E Salesforce Subscription Management environment as part of the Customer Pilot program.

This repository is currently limited to **Salesforce Core Spring '22 (236)** environments.  There are changes in Summer '22 (238) that may require significant modifications to licensing and provisioning, so any environment created during the developer preview period may not properly function upon the release of Summer '22 and therefore should be discarded at that time.

### **The Summer '22 (238) release of Salesforce Subscription Management will be the Generally Available (GA) version.**

There will be new environments available once Summer '22 is released, so it is recommended that you plan your development and deployment process accordingly.

### **INSTRUCTIONS**

Upon receipt and after confirming access to your customer preview environment, you can run the **setup.sh** script in the scripts directory to push the sample source, metadata and data, and will also set up a mock payment gateway.  After successful completion of the setup scripts, you will be able to use the published postman collection to access the org to validate your setup.

These scripts set up two default connected apps for you to facilitate your setup of the collection.  Please reference the consumer key and secret from the **Postman** connected app in your org to use in your collection environment variables.