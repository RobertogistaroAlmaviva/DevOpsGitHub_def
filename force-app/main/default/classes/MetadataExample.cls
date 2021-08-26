public class MetadataExample implements Metadata.DeployCallback{
    public void handleResult(Metadata.DeployResult result, Metadata.DeployCallbackContext context) {
        if (result.status == Metadata.DeployStatus.Succeeded) {
            //Success
            System.debug('Success Result-' + result);
        } else {
            //Failed
            System.debug('Failed Result-' + result);
              
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
     
        email.setSubject('   -');
            email.setToAddresses(new List<String>{'roberto.gistaro@enigen.eu'});
        
        email.setHtmlBody(String.valueof(result));
            Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        
        }
    }
        public static void updateMetadata() { 
            // Set up custom metadata to be created in the subscriber org.
    Metadata.CustomMetadata customMetadata =  new Metadata.CustomMetadata();
    customMetadata.fullName = 'test.Admin';

    Metadata.CustomMetadataValue customField = new Metadata.CustomMetadataValue();
    customField.field = 'customField__c';
    customField.value = 'New value';

    customMetadata.values.add(customField);
                    Metadata.DeployContainer deployContainer  = new Metadata.DeployContainer();
            deployContainer.addMetadata(customMetadata);
                   MetadataExample callback = new MetadataExample();
            try{
        Id jobId = Metadata.Operations.enqueueDeployment(deployContainer, callback);
            }catch(Exception e ){
                system.debug(''+e);
            }

        }
}