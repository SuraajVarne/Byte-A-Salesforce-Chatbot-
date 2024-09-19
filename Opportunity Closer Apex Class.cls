/**
 * OpportunityCloser Apex Class
 * Description: This class closes an opportunity in Salesforce.
 *              It takes in an opportunity name and closes it by setting the stage to "Closed Won" or "Closed Lost".
 */
public class OpportunityCloser {
    
    @InvocableMethod
    public static List<Opportunity> closeOpportunity(List<OpportunityCloseRequest> requests) {
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        
        for (OpportunityCloseRequest req : requests) {
            List<Opportunity> opps = [SELECT Id, StageName FROM Opportunity WHERE Name = :req.opportunityName LIMIT 1];
            
            for (Opportunity opp : opps) {
                opp.StageName = req.closeStage; // Update the stage to "Closed Won" or "Closed Lost"
                opportunitiesToUpdate.add(opp);
            }
        }
        
        if (!opportunitiesToUpdate.isEmpty()) {
            try {
                update opportunitiesToUpdate;
            } catch (DmlException e) {
                System.debug('Error occurred during opportunity closure: ' + e.getMessage());
            }
        }
        
        return opportunitiesToUpdate;
    }
    
    public class OpportunityCloseRequest {
        @InvocableVariable
        public String opportunityName; // Name of the opportunity to close
        @InvocableVariable
        public String closeStage; // Stage to close the opportunity with ("Closed Won" or "Closed Lost")
    }
}