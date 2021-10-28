# SalesforceDynamicCustomLabel
Demonstrate the logic to fetch a custom label value dynamically in salesforce.

In Apex, we need to reference a label as System.Label.CUSTOM_LABEL_API_NAME or just Label.CUSTOM_LABEL_API_NAME

In LWC we need to import a specific label as below to use it:
import randomLabel from '@salesforce/label/namespace.CUSTOM_LABEL_API_NAME';

In Aura we fetch the value as $A.get(“$Label.namespace.CUSTOM_LABEL_API_NAME”)

Many a time we need to fetch the value of a custom label dynamically in an apex class or LWC or Aura components but as of now, Salesforce (v53.0) doesn't provide any OOTB feature/method/Query to fetch a custom label dynamically. So to overcome this we can make use of the mechanism demonstrated in this playground package so as to get the value of any specific custom label dynamically.

Add-on: If translation is enabled in your environment, and you've custom labels in different languages, it can fetch the value as per the user's default language.
