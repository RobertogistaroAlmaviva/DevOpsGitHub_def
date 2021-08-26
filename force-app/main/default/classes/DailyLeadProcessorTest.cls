@isTest
public class DailyLeadProcessorTest {
        public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    @testSetup 
    static void setup() {
        List<lead> accounts = new List<lead>();
        // add a parent account
        // add 100 child accounts
        for (Integer i = 0; i < 200; i++) {
            accounts.add(new lead(
                lastname='Test Account'+i,company='test'+i
            ));
        }
       
        insert accounts;
       
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
       
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());  
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
    }
    
}