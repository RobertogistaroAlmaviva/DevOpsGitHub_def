public class AccountProcessor {
@future(callout=true)
    public static void countContacts(List<ID> idA) {
        Map<id,integer> MapAC=new Map<id,integer>();
       AggregateResult[] a=[select count(id) cont,accountid from contact where accountid=:idA group by accountid];
       for(AggregateResult aa:a) MapAC.put((ID)aa.get('accountid'),(integer)aa.get('cont'));
       List<Account> accupt=new List<Account>();
        for(Id ii:idA) accupt.add(new Account(ID=ii,Number_of_Contacts__c=MapAc.get(ii)));
           
    }
}