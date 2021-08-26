public with sharing  class PROVACONTROLLERPAGEACC extends NewChildControllerBase {
    Public id accid{get;set;}
     public PROVACONTROLLERPAGEACC(ApexPages.StandardController ignored) {
         
        super(Account.SObjectType, Contact.SObjectType);
         
    }
       
}