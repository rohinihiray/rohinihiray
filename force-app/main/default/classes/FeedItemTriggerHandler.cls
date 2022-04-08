/**********************************************************************************************************
* Class Name: FeedItemTriggerHandler
* Author: KGS
*
* ============================================================================================================
* ============================================================================================================
* Purpose: This class updates the visiblity of feedItem.
* ============================================================================================================
* ============================================================================================================
* History:
* VERSION     DATE                  INITIALS      DESCRIPTION/FEATURES ADDED
* 1.0         01-December-2021      KGS           Initial Development
***********************************************************************************************************/
public class FeedItemTriggerHandler {
    
    public static void FeedItemTriggerHandlerRun() {       
        if(Trigger.isBefore && Trigger.isInsert){    
            updateChatterVisiblity(Trigger.new);
        }       
    }
    
    //This method updates the chatter visiblity to 'AllUsers'.
    public static void updateChatterVisiblity(List<FeedItem> sObjectList){
        
        List<Choose_type_of_chatter_post_visibility__mdt> chatterVisibilityMdt = [SELECT Choose_Type_of_chatter_post_visibility__c
                                                                                  , Org_wide__c
                                                                                  ,Object_chatter_post_visibility_default__c
                                                                                  , Chatter_post_visibility_validation_msg__c
                                                                                  FROM Choose_type_of_chatter_post_visibility__mdt]; 
        
        for(Choose_Type_of_chatter_post_visibility__mdt cMDT : chatterVisibilityMdt) {
            
            FeedItem obj = sObjectList[0];
            string mdtObjectLst = cMDT.Object_chatter_post_visibility_default__c;
            //check visibility    
            if(cMDT.Choose_Type_of_chatter_post_visibility__c == 'Object-wise Default') {
                 //get parent object name  
           		 if(mdtObjectLst.contains(obj.ParentId.getSObjectType().getDescribe().getName())) {
                     //check visibility
                     if((obj.Visibility == 'AllUsers' && cMDT.Org_wide__c == 'Internal only')||(obj.Visibility == 'InternalUsers' && cMDT.Org_wide__c == 'All with Access')){
                            //throw an error 
                            obj.addError(cMDT.chatter_post_visibility_validation_Msg__c);
                     }
                  }
             }
            
        }//end of for loop
    }
 
}