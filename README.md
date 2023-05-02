# SalesforceDynamicCustomLabel
An utility that helps to fetch multiple custom labels dynamically in the preferred language.

### Introduction:
Today, in Salesforce a Custom Label could be fetched in the following ways:
- In Apex, we need to reference a label as System.Label.CUSTOM_LABEL_API_NAME or just Label.CUSTOM_LABEL_API_NAME
- In LWC we need to import a specific label as below to use it: import randomLabel from '@salesforce/label/namespace.CUSTOM_LABEL_API_NAME';
- In Aura we fetch the value as $A.get(“$Label.namespace.CUSTOM_LABEL_API_NAME”)

### Problem Statement:
Many a time we need to fetch the value of a custom label dynamically in an apex class or LWC or Aura components but as of now, Salesforce (v58.0) doesn't provide any OOTB feature/method/Query to fetch a custom label dynamically.

### Solution:
Use the DynamicCustomLabelController.getDynamicCustomLabel method from any Aura/LWC or any other apex class to fetch multiple custom labels dynamically.

> [NOTE]: If translation is enabled in your environment, and you've custom labels in different languages, it can fetch the value as per the user's default language or the supplied language.

### Authors: [@chayan93](https://www.github.com/chayan93)

### Reach me at:
[![github](https://img.shields.io/badge/github-black?style=for-the-badge&logo=github&logoColor=white)](https://www.github.com/chayan93/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/chayan93/)
[![facebook](https://img.shields.io/badge/facebook-black?style=for-the-badge&logo=facebook&logoColor=white)](https://www.facebook.com/chayan93/)
[![instagram](https://img.shields.io/badge/instagram-0A66C2?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/the_lowkey_bong/)

### Acknowledgement
README generated from [readme.so](https://readme.so/editor)