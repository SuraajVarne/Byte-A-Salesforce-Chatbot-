/**
 * OpportunityDescriptionUpdater Apex Class
 * Description: This class updates the description of an opportunity in Salesforce.
 *              It takes in an opportunity name and a new description, then updates the corresponding opportunity.
 */
public class OpportunityDescriptionUpdater {
    
    @InvocableMethod
    public static List<Opportunity> updateOpportunityDescription(List<OpportunityRequest> requests) {
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        
        for (OpportunityRequest req : requests) {
            List<Opportunity> opps = [SELECT Id, Description FROM Opportunity WHERE Name
= :req.opportunityName LIMIT 1];
            
            for (Opportunity opp : opps) {
                opp.Description = req.newDescription; // Update the description
                opportunitiesToUpdate.add(opp);
            }
        }
        
        if (!opportunitiesToUpdate.isEmpty()) {
            try {
                update opportunitiesToUpdate;
            } catch (DmlException e) {
                System.debug('Error occurred during opportunity update: ' + e.getMessage());
            }
        }
        
        return opportunitiesToUpdate;
    }
    
    public class OpportunityRequest {
        @InvocableVariable
        public String opportunityName; // Name of the opportunity to update
        @InvocableVariable
        public String newDescription; // New description for the opportunity
    }
}