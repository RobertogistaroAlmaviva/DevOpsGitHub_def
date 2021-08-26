@IsTest
private class AccountProcessorTest {
     @IsTest
  private static void testAccountProcessorTest() {
   account a=new account(name='tret0');
    insert a;
      List<id> aa=new List<id>();
      aa.add(a.id);
 
      Test.startTest();
      AccountProcessor.countContacts(aa);
    Test.stopTest();
    // runs callout and check results
  }
}