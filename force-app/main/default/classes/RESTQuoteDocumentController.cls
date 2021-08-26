@RestResource(urlMapping='/FieldQuoteDocument/*')
global with sharing class RESTQuoteDocumentController {

   /* @HttpPost 
    global static String createNewQuoteDocument(Id QuoteId, String Title, String body){
        System.debug('Id Quote'+QuoteId);
        map<string,string> result = new map<string,string>();
        blob text = EncodingUtil.base64Decode(body);
        //text = string.valueof();
        System.debug('body string '+body);
        //System.debug('body blob '+text.toString());
        System.debug('blob' + text);
        ContentVersion cv = new ContentVersion();
        cv.ContentLocation = 'S';
        cv.VersionData = Blob.toPdf(body);
        cv.Title = Title;
        cv.PathOnClient = Title;
        insert cv;
        
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id =: cv.Id].ContentDocumentId;
        cdl.LinkedEntityId = QuoteId;
        cdl.ShareType = 'V';
        
        insert cdl;
        
        result.put('success','true');
        result.put('id',cdl.id);
        return json.serialize(result);
    }*/
    @HttpPost 
    global static String createNewQuoteDocument(Id QuoteId, String Title, String body){
        System.debug('Id Quote'+QuoteId);
        map<string,string> result = new map<string,string>();
        blob text = EncodingUtil.base64Decode(body);
        //text = string.valueof();
        System.debug('body string '+body);
        //System.debug('body blob '+text.toString());
        System.debug('blob' + text);
        ContentVersion cv = new ContentVersion();
        cv.ContentLocation = 'S';
        cv.VersionData = text;
        cv.Title = Title;
        cv.PathOnClient = Title;
        insert cv;
        
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id =: cv.Id].ContentDocumentId;
        cdl.LinkedEntityId = QuoteId;
        cdl.ShareType = 'V';
        
        insert cdl;
        
        result.put('success','true');
        result.put('id',cdl.id);
        return json.serialize(result);
    }
}