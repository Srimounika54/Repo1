public class BatchforOpportunities implements Database.Batchable<sobject> {

    public Database.QueryLocator start(Database.BatchableContext BC) {
        system.debug('start method Called - updated');
        String query='SELECT Id, Name, StageName FROM Opportunity WHERE StageName=\'Closed won\' AND CloseDate < Last_N_Days';
        return Database.getQueryLocator(query);

    }

    public void execute (Database.BatchableContext BC, List<Opportunity> scope) {
        for (Opportunity opp : scope)
            system.debug(opp.Name);
        
    }
    public void finish(Database.BatchableContext BC) {
        system.debug('finish method Called');
    }

}