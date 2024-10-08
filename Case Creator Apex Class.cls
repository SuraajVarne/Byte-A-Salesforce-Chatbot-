/**
 * CaseCreator Apex Class
 * Description: This class creates a new case in Salesforce and associates it with a contact.
 *              It takes in a subject, description, and contact name.
 */
public class CaseCreator {
    
    @InvocableMethod
    public static List<Case> createCase(List<CaseRequest> requests) {
        List<Case> casesToInsert = new List<Case>();
        
        for (CaseRequest req : requests) {
            Contact contact = [SELECT Id FROM Contact WHERE Name = :req.contactName LIMIT 1];
            Case newCase = new Case();
            newCase.Subject = req.subject;
            newCase.Description = req.caseDescription;
            newCase.ContactId = contact.Id; // Associate with a contact
            
            casesToInsert.add(newCase);
        }
        
        if (!casesToInsert.isEmpty()) {
            try {
                insert casesToInsert;
            } catch (DmlException e) {
                System.debug('Error occurred during case insertion: ' + e.getMessage());
            }
        }
        
        return casesToInsert;
    }
    
    public class CaseRequest {
        @InvocableVariable
        public String subject; // Case subject
        @InvocableVariable
        public String caseDescription; // Case description
        @InvocableVariable
        public String contactName; // Name of the contact to associate with the case
    }
}