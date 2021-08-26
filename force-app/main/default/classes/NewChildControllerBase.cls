public abstract  class NewChildControllerBase {
    private SObjectType parentSobType;
    private SObjectType childSobType;
    public NewChildControllerBase(SObjectType parentSobType, SObjectType childSobType) {
        this.parentSobType = parentSobType;
        this.childSobType = childSobType;
    }
    public PageReference url() {
        PageReference p = new PageReference('/' + childSobType.getDescribe().getKeyPrefix() + '/e');
        Map<String, String> m = p.getParameters();
        m.put('accid','0010O00001rrmL3');
       /* m.putAll(ApexPages.currentPage().getParameters());*/
        m.put('RecordType', '0120O000000BstG');
        /*m.put('nooverride', '1');
        return p;
    }
    private Id getChildRecordTypeId(Id parentId) {
        SObject parent = Database.query('selectordType.DeveloperName from ' + String.valueOf(parentSobType)
                + ' where Id = :parentId');
        String parentDeveloperName = (String) parent.getSobject('RecordType').get('DeveloperName');
        return [select Id from RecordType where SObjectType = :String.valueOf(childSobType)
                and DeveloperName = :parentDeveloperName].Id;
    }
    private Id getParentSObjectId(Map<String, String> m) {
        for (String key : m.keySet()) {
            if (key.endsWith('_lkid')) {
                return m.get(key);
            }
        }*/
        return p;
       
    }
}