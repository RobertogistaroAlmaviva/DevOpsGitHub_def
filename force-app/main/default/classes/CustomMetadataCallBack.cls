public class CustomMetadataCallBack implements Metadata.DeployCallback {
     
    //Inteface method 
    public void handleResult(Metadata.DeployResult result, Metadata.DeployCallbackContext context) {
        if (result.status == Metadata.DeployStatus.Succeeded) {
            //Success
        } else {
            //Failed
        }
    }
}