public class handler {
    public static integer prova;
   
    public static void s(){
        prova=1;
    }
    public static integer g(){
        return prova;
    }
       @future  
    public static void h(Id q,Id o){
        
  List<opportunity> oo=[select id from opportunity where id=:o];
        for(opportunity i:oo) i.syncedquoteid=q;prova=1;
              update oo;
          
         
     
    }
        
    
}