@isTest
private class inseert_Test {
  
    
  
    
    private static testMethod void insertCourseDeliverySuccess() {
		Account c=new Account(Name='ciao');
        insert c;
		List<Account> acc=new List<Account>();
        acc.add(new Account(Name='ciao'));
      
       
       
        List<Database.SaveResult> insertionResult = Database.insert(acc, false);

        // Determine if insertionResult contains any errors, and, if so, which errors
        Integer errorCount = 0;
        //TODO #5: Review this code that processes the result of the Database.insert above
        for(Database.SaveResult i:insertionResult){
        if(!i.isSuccess()) {
            if (i.getErrors()[0].getMessage() == 'no')
                
                ++errorCount;
    	}
    //TODO #6: Use the assertEquals method of the System class to raise an assertion
    //         if the number of errors reported by errorCount does not equal 0.
    System.assertEquals(1, errorCount);
        }}
}