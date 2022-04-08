public class ProjectRelatedChatterController {

    @AuraEnabled
    public Id recordId {get; set;}
    
    public ProjectRelatedChatterController() {
        recordId = ApexPages.CurrentPage().getparameters().get('id');
               
    }
    
    
}