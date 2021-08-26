@isTest
private class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<lead> accounts = new List<lead>();
        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            accounts.add(new lead(lastname='Account '+i,company=string.valueof(i)));
        }
        insert accounts;
     
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
    }
    
}