/**
 * OpportunityStatsCalculator Apex Class
 * Description: This class calculates statistics for an opportunity in Salesforce.
 *              It takes in an opportunity name and returns various statistics like the probability of closing.
 */
public class OpportunityStatsCalculator {
    
    @InvocableMethod
    public static List<OpportunityStats> calculateOpportunityStats(List<OpportunityRequest> requests) {
        List<OpportunityStats> statsList = new List<OpportunityStats>();
        
        for (OpportunityRequest req : requests) {
            Opportunity opp = [SELECT Amount, StageName, Probability FROM Opportunity WHERE Name = :req.opportunityName LIMIT 1];
            OpportunityStats stats = new OpportunityStats();
            
            stats.opportunityName = req.opportunityName;
            stats.amount = opp.Amount;
            stats.probability = opp.Probability;
            stats.isLikelyToClose = (opp.Probability > 50) ? true : false; // Simple logic based on probability
            
            statsList.add(stats);
        }
        
        return statsList;
    }
    
    public class OpportunityRequest {
        @InvocableVariable
        public String opportunityName; // Name of the opportunity
    }
    
    public class OpportunityStats {
        @InvocableVariable
        public String opportunityName; // Name of the opportunity
        @InvocableVariable
        public Decimal amount; // Opportunity amount
        @InvocableVariable
        public Decimal probability; // Opportunity probability
        @InvocableVariable
        public Boolean isLikelyToClose; // Whether the opportunity is likely to close
    }
}