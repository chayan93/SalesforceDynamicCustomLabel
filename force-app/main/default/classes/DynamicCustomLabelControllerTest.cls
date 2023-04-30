/**
 * @description       : Test class for DynamicCustomLabelController
 * @author            : chayan.batabyal@neuraflash.com
 * @last modified on  : 30-04-2023
 * @last modified by  : Chayan Batabyal
**/
@isTest(seeAllData = false)
public with sharing class DynamicCustomLabelControllerTest {
    @isTest
    static void getDynamicCustomLabelTest(){
        Test.startTest();

        Map<String, String> response = DynamicCustomLabelController.getDynamicCustomLabel(
            'TEST_CUSTOM_LABEL', 'en_US', true
        );
        Assert.areEqual(1, response.keySet().size(), '1 Label received');

        response = DynamicCustomLabelController.getDynamicCustomLabel(
            'TEST_CUSTOM_LABEL', 'en_US', false
        );
        Assert.areEqual(1, response.keySet().size(), '1 Label received');

        response = DynamicCustomLabelController.getDynamicCustomLabel(
            null, 'en_US', false
        );
        Assert.areEqual(null, response, 'null response due to error');

        Test.stopTest();
    }

    @isTest
    static void getterSetterAndConstructorTest(){
        Test.startTest();

        PageReference ref = Page.DynamicCustomLabel;
        ref.getParameters().putAll(new Map<String, String>{
            'language' => 'en_US', 'labelsToFetch' => 'TEST_CUSTOM_LABEL'
        });
        Test.setCurrentPage(ref);

        DynamicCustomLabelController objCls = new DynamicCustomLabelController();
        Assert.areEqual(1, objCls.labels.size());

        Test.stopTest();
    }
}