/**
 * CaseDescriptionUpdater Apex Class
 * Description: This class updates the description of a case in Salesforce.
 *              It takes in a case name and a new description, then updates the corresponding case.
 */
public class CaseDescriptionUpdater {
    
    @InvocableMethod
    public static List<Case> updateCaseDescription(List<CaseRequest> requests) {
        List<Case> casesToUpdate = new List<Case>();
        
        for (CaseRequest req : requests) {
            List<Case> cases = [SELECT Id, Description FROM Case WHERE Subject = :req.caseName LIMIT 1];
            
            for (Case c : cases) {
                c.Description = req.newDescription; // Update the description
                casesToUpdate.add(c);
            }
        }
        
        if (!casesToUpdate.isEmpty()) {
            try {
                update casesToUpdate;
            } catch (DmlException e) {
                System.debug('Error occurred during case update: ' + e.getMessage());
            }
        }
        
        return casesToUpdate;
    }
    
    public class CaseRequest {
        @InvocableVariable
        public String caseName; // Name of the case to update
        @InvocableVariable
        public String newDescription; // New description for the case
    }
}