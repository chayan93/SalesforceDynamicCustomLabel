/**
 * @description       : Controller class for DynamicCustomLabel VF page
 * @author            : chayan.batabyal@neuraflash.com
 * @last modified on  : 30-04-2023
 * @last modified by  : Chayan Batabyal
**/
public with sharing class DynamicCustomLabelController {
    public List<String> labels { get; set; }

    /**
    * @description Constructor override
    * @author Chayan Batabyal | 30-04-2023
    **/
    public DynamicCustomLabelController(){
        Map<String, String> pageParams = ApexPages.currentPage().getParameters();
        // expecting labels to be separated by ;
        String labelsToFetch = pageParams.get('labelsToFetch');
        labels = String.isNotBlank(labelsToFetch)
            ? labelsToFetch.trim().removeEnd(';').split(';')
            : new List<String>();
    }

    /**
    * @description Expects a string with all the custom labels to be fetched(each label being separated by ;)
    * @author Chayan Batabyal | 30-04-2023
    * @param String labelsToFetch
    * @param String language
    * @param Boolean isInExperienceBuilder
    * @return Map<String, String>
    **/
    @AuraEnabled
    public static Map<String, String> getDynamicCustomLabel(
        String labelsToFetch, String language, Boolean isInExperienceBuilder
    ) {
        Map<String, String> customLabelMap = new Map<String, String>();

        try{
            // We can use any standard language value here(en_US, de, fr, es, etc.)
            // If the translation is not found, company default language is returned.
            language = String.isNotBlank(language) ? language : UserInfo.getLanguage();

            // The isInExperienceBuilder parameter of the getDynamicCustomLabel method is used to determine if the requestor
            // (LWC or Aura) is running in the Experience Builder content or is it in the actual run.
            // We need this because SF gives us an error when tryign to use the VF Page during Experience Builder run
            // In JS if the below condition evaluates to true, then the context is experience builder
            // location.hostname.endsWith("salesforce-experience.com")
            if(!isInExperienceBuilder){
                PageReference ref = Page.DynamicCustomLabel;
                String content;

                ref.getParameters().putAll(new Map<String, String>{
                    'language' => language, 'labelsToFetch' => labelsToFetch
                });

                if(Test.isRunningTest()){
                    content = '[';
                    for(String eachLabel : labelsToFetch.split(';')){
                        content += '{"' + eachLabel + '":"1~~2~~3~~4"},';
                    }
                    content = content.removeEnd(',') + ']';
                }
                else{
                    content =  ref.getContent().toString().removeEnd(',]') +']';
                    content = String.escapeSingleQuotes(
                        content.replaceAll('"', 'DQ_AP').replaceAll('DQ_VF', '"')
                    ).replaceAll('\\\\\'', '\'');
                }

                List<Object> allLabels = (List<Object>)JSON.deserializeUntyped(content);
                for(Object eachRecord : allLabels){
                    Map<String, Object> labelDetails = (Map<String, Object>)JSON.deserializeUntyped(
                        JSON.serialize(eachRecord)
                    );
                    for(String eachLabel : labelDetails.keySet()){
                        customLabelMap.put(
                            eachLabel,
                            String.valueOf(labelDetails.get(eachLabel)).replaceAll('\\\\DQ_AP', '"')
                            .unescapeEcmaScript()
                        );
                    }
                }
            }
            else{
                for(String eachLabel : labelsToFetch.split(';')){
                    customLabelMap.put(eachLabel, eachLabel);
                }
            }
        }
        catch(Exception ex){
            System.debug(ex.getMessage() + ' occured at LN: ' + ex.getLineNumber());
            System.debug(ex.getStackTraceString());
            customLabelMap = null;
        }

        return customLabelMap;
    }
}