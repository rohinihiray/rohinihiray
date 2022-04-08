@isTest
public class FeedItemTriggerHandlerTest {
    @isTest
    public static void positiveTestBeforeInsert(){
        
        Contact conObj =  FeedItemTestDataFactory.createContact();
        insert conObj;
        
        Account acc = new Account(Name = 'Test Account',Type = 'Analyst',Industry = 'Agriculture');
        insert acc;
        List<FeedItem> feedItemList = FeedItemTestDataFactory.createFeedItem(5,acc.Id);
        
        Test.startTest();
        try
        {
            insert feedItemList;
        }
        catch(Exception e)
        {
        String message = e.getMessage();
         system.assert(message.contains('Select visibility based on Custom metadata'), 'message=' + message);

        }
        Test.stopTest();        
        
        List<FeedItem> feedItemAssertList = [Select Id,Status From FeedItem ];
        for(FeedItem feedItemObj: feedItemAssertList){
            system.assertEquals('Published',feedItemObj.Status);
        }
        
        
    } 
/*
    static testmethod void testIncrement() {
        FeedItemTriggerHandler.justIncrement();
    }*/
    
}