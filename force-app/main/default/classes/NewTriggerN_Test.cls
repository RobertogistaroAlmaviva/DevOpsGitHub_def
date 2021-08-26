@isTest
private class NewTriggerN_Test {
 @TestSetup
    private static void load(){
        Test.loadData(Holiday.sobjectType, 'Test_Holiday');
        System.debug([SELECT ActivityDate FROM Holiday]);
        
    }
    private static  testMethod void c(){
        Course__c cors=new Course__c(Name='Course1',Status__c='Active');
        insert cors;
        Course_Delivery__c del=new Course_Delivery__c(Course__c=cors.ID,Start_Date__c=Date.newInstance(Date.today().year(), 9, 1));
        Database.SaveResult res=Database.insert(del,false);
        Integer i=0;
        if(!res.isSuccess()){
            if(res.getErrors()[0].getMessage()=='non possibile'){
                i=i++;
            }
            System.assertEquals(0,i);
            
           
            
            
        }
        
           Course_Delivery__c dell=new Course_Delivery__c(Course__c=cors.ID,Start_Date__c=Date.newInstance(4000,01,01));
        Database.SaveResult ress=Database.insert(dell,false);
        Integer x=0;
        if(!ress.isSuccess()){
            if(ress.getErrors()[0].getMessage()=='non possibile'){
                x=x++;
            }
            System.assertEquals(0,x);
            
           
            
            
        }
        
        }
}