global class LeadProcessor implements 
    Database.Batchable<sObject> {
    
    // instance member to retain state across transactions.
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, leadsource FROM lead'
        );
    }
    global void execute(Database.BatchableContext bc, List<lead> scope){
        // process each batch of records
        for (lead ac : scope) {
               ac.leadsource='Dreamforce';
            }
        
        update scope;
    }    
    global void finish(Database.BatchableContext bc){
      
    }    
}
