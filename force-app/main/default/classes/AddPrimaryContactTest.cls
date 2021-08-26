@isTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add a parent account
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,billingstate='NY'
            ));
        }
         for (Integer i = 50; i < 100; i++) {
            accounts.add(new Account(
                name='Test Account'+i,billingstate='CA'
            ));
        }
        insert accounts;
        contact c=new contact(lastname='tet');
        insert c;
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        contact c=[select id,lastname from contact limit 1];
        system.debug([select count(id) from contact]);
        AddPrimaryContact updater = new AddPrimaryContact(c, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [select count() from contact where id != :c.id]);
    }
    
}