public class animals_extensions {
 
    // Constructor - this only really matters if the autoRun function doesn't work right
    private final Animals__c a;
    public animals_extensions(ApexPages.StandardController stdController) {
        this.a = (Animals__c)stdController.getRecord();
    }
     
    // Code we will invoke on page load.
    public PageReference sendEvalEmail () {
 
        String theId = ApexPages.currentPage().getParameters().get('id');
 
        if (theId == null) {
            // Display the Visualforce page's content if no Id is passed over
            return null;
        }
 
        for (Animals__c o:[select id, name, site__c from Animals__c where id =:theId]) {
            o.AnimalPriority__c = '4444';
            system.debug ('sent email');
            update o;
        }
 
        // Redirect the user back to the original page
        PageReference pageRef = new PageReference('/' + theId);
        pageRef.setRedirect(true);
        return pageRef;
 
    }
 
}