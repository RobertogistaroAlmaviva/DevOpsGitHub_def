@isTest
public class cancel_Test {
    
    public static TestMethod void load(){
        Course__c  x=new Course__c(Name='cc');
        insert x;
        Course_Delivery__c xx=new Course_Delivery__c(Course__c=x.ID,Attendee_Count__c=1, Location__c='x', Region__c='x', Start_Date__c=Date.newInstance(1999,1,1));
        insert xx;
        
        Database.DeleteResult res=Database.delete(x,false);
        Integer i=0;
        if(!res.isSuccess()){
            if(res.getErrors()[0].getMessage() == 'no'){
                i=i+1;
            }
            
        }
        System.assertEquals(1,i);
         
        
        
    }

}