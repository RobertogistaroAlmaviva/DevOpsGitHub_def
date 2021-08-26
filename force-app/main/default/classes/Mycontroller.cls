public class Mycontroller {
    Public Contact a{get;set;}
    
    public Mycontroller(){
        a=[SELECT Email FROM Contact WHERE ID=:ApexPages.currentPage().getParameters().get('ID')];
        
        
    }
    public PageReference save(){
        upsert a;

        PageReference redirectSuccess = Page.Proviamo;
redirectSuccess.setRedirect(true);
        redirectSuccess.getParameters().put('id',a.Id);
        return (redirectSuccess);

        
    }    
        
  
    

}