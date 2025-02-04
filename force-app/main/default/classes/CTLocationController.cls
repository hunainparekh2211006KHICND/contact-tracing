public with sharing class CTLocationController {
    public CTLocationController() {
        
    }

    public static List<Location__c> getRecentHealthChanges(){
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
   }

   public static List<Location__c> serachLocations(String searchTerm){
       searchTerm = searchTerm+'%';
       return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c WHERE Name LIKE :searchTerm OR Pincode__c LIKE :searchTerm OR Address__c LIKE :searchTerm ORDER BY Status_Update_Date__c DESC NULLS LAST];
   }
   
   public static Location__c getLocationById(String locationId){
       List<Location__c> locations = [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c WHERE Id=:locationId LIMIT 1];
       if(locations != null && locations.size() > 0){
            return locations[0];
       }
       return null;
   }
}