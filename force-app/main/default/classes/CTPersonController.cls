public with sharing class CTPersonController {
    public CTPersonController() {

    }

    public static String getToken(String mobileNo){
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5',value);
        return EncodingUtil.base64Encode(hash);
    }

    public static List<Person__c> getRecentHealthChanges(){
         return [SELECT Token__c, Status_Update_Date__c, Mobile__c, Health_Status__c, Name, Id FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    }

    public static List<Person__c> serachPeople(String searchTerm){
        searchTerm = searchTerm+'%';
        return [SELECT Token__c, Status_Update_Date__c, Mobile__c, Health_Status__c, Name, Id FROM Person__c WHERE Name LIKE :searchTerm OR Mobile__c LIKE :searchTerm OR Token__c LIKE :searchTerm ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }
    
    public static Person__c getPersonById(String personId){
        return [SELECT Token__c, Status_Update_Date__c, Mobile__c, Health_Status__c, Name, Id FROM Person__c WHERE Id=:personId LIMIT 1];
    }
}