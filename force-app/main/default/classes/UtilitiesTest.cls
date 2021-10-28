/**
 * @description       : Test class for Utilities
 * @author            : chayanbatabyal@gmail.com
 * @last modified on  : 10-28-2021
 * @last modified by  : chayanbatabyal@gmail.com
**/
@isTest
public with sharing class UtilitiesTest {
    /**
    * @description Positive testing the getDynamicCustomLabel method
    * @author chayanbatabyal@gmail.com | 10-28-2021
    * @return testMethod
    **/
    public static testMethod void getDynamicCustomLabelPositiveTest(){
        Test.startTest();
        System.assertEquals(
            Utilities.getDynamicCustomLabel('TEST_CUSTOM_LABEL'),
            LABEL.TEST_CUSTOM_LABEL
        );
        Test.stopTest();
    }

    /**
    * @description Negative testing the getDynamicCustomLabel method
    * @author chayanbatabyal@gmail.com | 10-28-2021
    * @return testMethod
    **/
    public static testMethod void getDynamicCustomLabelNegativeTest(){
        Test.startTest();
        System.assertEquals(Utilities.getDynamicCustomLabel('NON_EXISTANT_LABEL'), null);
        Test.stopTest();
    }
}