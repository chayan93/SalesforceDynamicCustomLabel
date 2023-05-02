# SalesforceDynamicCustomLabel
A utility that helps to fetch multiple custom labels dynamically in the preferred language.

### Introduction:
Today, in Salesforce a Custom Label could be fetched in the following ways:
- In Apex, we need to reference a label as System.Label.CUSTOM_LABEL_API_NAME or just Label.CUSTOM_LABEL_API_NAME
- In LWC we need to import a specific label as below to use it: import randomLabel from '@salesforce/label/namespace.CUSTOM_LABEL_API_NAME';
- In Aura we fetch the value as $A.get(“$Label.namespace.CUSTOM_LABEL_API_NAME”)

### Problem Statement:
Many a time we need to fetch the value of a custom label dynamically in an apex class or LWC or Aura components but as of now, Salesforce (v58.0) doesn't provide any OOTB feature/method/Query to fetch a custom label dynamically.

### Solution:
Use the DynamicCustomLabelController.getDynamicCustomLabel method from any Aura/LWC or any other apex class to fetch multiple custom labels dynamically.

### Note:
If translation is enabled in your environment, and you've custom labels in different languages, it can fetch the value as per the user's default language or the supplied language.

### Deployment:
To deploy this to any Sandbox or developer org, please visit [PlayG](https://live.playg.app/play/dynamic-custom-labels) and click on the Deploy button at the top-right.

### Post-Deployment:
Assign the Dynamic_Custom_Label permission set to any user who'd use this functionality.

### Screenshots:
![Screenshot 2023-05-02 201715](https://user-images.githubusercontent.com/31616825/235703825-fe4247b3-3f01-422f-963a-9b537f8525d0.png)
![Screenshot 2023-05-02 201739](https://user-images.githubusercontent.com/31616825/235703865-b12f3f01-a1fd-425c-84e8-5ef8db4cb9e7.png)
![Screenshot 2023-05-02 202533](https://user-images.githubusercontent.com/31616825/235704502-34de5cd2-8e82-4d8a-91e9-5a8de7ca0e0c.png)

### Authors: [@chayan93](https://www.github.com/chayan93)

### Reach me at:
[![github](https://img.shields.io/badge/github-black?style=for-the-badge&logo=github&logoColor=white)](https://www.github.com/chayan93/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/chayan93/)
[![facebook](https://img.shields.io/badge/facebook-black?style=for-the-badge&logo=facebook&logoColor=white)](https://www.facebook.com/chayan93/)
[![instagram](https://img.shields.io/badge/instagram-0A66C2?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/the_lowkey_bong/)

### Acknowledgement
README generated from [readme.so](https://readme.so/editor)
