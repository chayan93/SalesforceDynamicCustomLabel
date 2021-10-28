/**
 * @description       : Utility class for numerous functionalities
 * @author            : chayanbatabyal@gmail.com
 * @last modified on  : 10-28-2021
 * @last modified by  : chayanbatabyal@gmail.com
 * Modifications Log
 * Ver   Date         Author                           Modification
 * 1.0   03-04-2021   chayanbatabyal@gmail.com   Initial Version
**/
public inherited sharing class Utilities {
    /**
    * @description Gets the value of a custom label dynamically
    * @author chayanbatabyal@gmail.com | 03-16-2021
    * @param language
    * @param labelToFetch
    * @return String
    **/
    @AuraEnabled(cacheable=true)
    public static String getDynamicCustomLabel(String labelToFetch) {
        String valueToReturn;
        try{
            PageReference ref = Page.DynamicCustomLabel;
            ref.getParameters().putAll(
                new Map<String, String>{
                    'language' => UserInfo.getLanguage(),
                    'labelToFetch' => labelToFetch
                }
            );

            Map<String, Object> labelDetails = (Map<String, Object>)JSON.deserializeUntyped(
                ref.getContent().toString()
            );
            valueToReturn = String.valueOf(labelDetails.get('value'));
        }
        catch(Exception e){
            System.debug('Exception occured at :: ' + e.getLineNumber());
            System.debug('Exception occured :: ' + e.getMessage());
        }

        return valueToReturn;
    }
}
