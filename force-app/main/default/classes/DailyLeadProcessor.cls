global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<lead> opptys = [SELECT Id,leadsource 
            FROM lead 
            WHERE leadsource = null limit 200];
        // Create a task for each opportunity in the list
for(lead l:opptys)
	l.leadsource='Dreamforce';
        update opptys;
    }
    
}