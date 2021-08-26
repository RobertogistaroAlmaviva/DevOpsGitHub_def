@isTest
public class ContactsDMLN_Test2 {
    public static testMethod void c(){
        ContactsDMLN.standaloneDML();
        List<Contact> cs=[SELECT LastName FROM Contact];
        System.assertEquals(2,cs.size());
        Set<String> css=new Set<String>();
        for(Contact x:cs){
            css.add(x.LastName);
        }
        System.assert(css.contains('Minkowitz'));
        System.assert(css.contains('Singh'));

        
        
    }
     public static testMethod void c1(){
         try{
           ContactsDMLN.databaseMethodDML();
         }catch(DMLException e){
              System.assert(e.getMessage().contains('Required fields are missing: [LastName]: [LastName]'));
             
         }
     }
         public static testMethod void c2(){
                     ContactsDMLN.databaseMethodDMLAllOrNone();
             		List<Contact> cs=[SELECT Id FROM Contact];
             		System.assertEquals(1, cs.size());

             
         }

        
}