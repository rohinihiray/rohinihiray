public class FeedItemTestDataFactory {
public static Contact createContact(){
        
        Contact conObj = New Contact();
        conObj.LastName = 'Test';
        
        return conObj;
        
    }
    public static List<FeedItem> createFeedItem(Integer noOfFeedItem, String parentId) {
        List<FeedItem> feedItemListRecords = New List<FeedItem> ();
        if(noOfFeedItem > 0){
            for(Integer i=0; i<noOfFeedItem; i++){
                FeedItem FeedItemObj = New FeedItem();
                FeedItemObj.Body = 'Test'+i;
                FeedItemObj.Visibility = 'AllUsers';
                //if(String.isNotBlank(ParentId) && ParentId != null){
                    FeedItemObj.ParentId = parentId;
                //}
                
                feedItemListRecords.add(FeedItemObj);
            }
        }
        return feedItemListRecords;       
    } 
}