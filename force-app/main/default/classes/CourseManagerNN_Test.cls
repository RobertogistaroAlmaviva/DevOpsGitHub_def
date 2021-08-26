@isTest
public class CourseManagerNN_Test {
    private static List<Course__c> newCourse(integer i,integer y){
        integer z=0;
        List<Course__c> c=new List<Course__c>();
        for(z=i;z<=y;z++){
            c.add(new Course__c(name='Course'+z));
            
        }
	return c;
        
    }
    private static testMethod void c(){
        List<Course__c> oldc=newCourse(0,5);
        List<Course__c> newc=newCourse(3,6);
        Test.startTest();
        Set<Course__c> x=CourseManager.findDuplicates(oldc,newc);
        Test.stopTest();
        System.assertEquals(3,x.size());
    }
}