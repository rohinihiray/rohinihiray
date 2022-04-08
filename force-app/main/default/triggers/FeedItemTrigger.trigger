trigger FeedItemTrigger on FeedItem (before insert) {
     FeedItemTriggerHandler.FeedItemTriggerHandlerRun();
}