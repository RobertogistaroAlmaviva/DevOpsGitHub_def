public class AddPrimaryContact implements Queueable {
    
    private Contact contatto;
    private String stato;
    
    public AddPrimaryContact(Contact contatto, String stato) {
        
        this.contatto = contatto;
        this.stato = stato;
    }
    
    public void execute(QueueableContext context) {
        List<contact> c=new List<Contact>();
        List<Account> aint=[select id from account where billingstate=:stato limit 200];
        system.debug('aint'+aint.size());
        for (Account a :aint ) {
          contact c1=this.contatto.clone();
            c1.AccountId=a.id;
            c.add((c1));
          // perform other processing or callout
        }
        insert c;
    }
    
}