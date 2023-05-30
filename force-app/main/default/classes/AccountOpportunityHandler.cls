public with sharing class AccountOpportunityHandler implements ITrigger {
  
    /**
 * Sample Trigger Handler for Account
 */
      map<id,string> mapedAccounts=new map<id,string>();
  
    public void bulkBefore(){
       mapedAccounts= AccountOpportunityHelper.bulkOpportunity(trigger.new);
  		system.debug('--- bulkbEfore is called');      
    }
    
    public void bulkAfter(){
  		system.debug('--- bulkAfter is called');      
    }
    
    public void beforeInsert(sObject so) {
        AccountOpportunityHelper.accountCreater(mapedAccounts,(Opportunity)so);
        system.debug('--- beforeInsert is called');      
    }
    public void beforeUpdate(SObject oldSo, SObject so){
  		system.debug('--- beforeUpdate is called');      
    }

    public void beforeDelete(SObject so){
  		system.debug('--- beforeDelete is called');      
    }

    public void afterInsert(SObject so){
  		system.debug('--- afterInsert is called');      
    }

    public void afterUpdate(SObject oldSo, SObject so){
  		system.debug('--- afterUpdate is called');      
    }

    public void afterDelete(SObject so){
  		system.debug('--- afterDelete is called');      
    }
  
    public void andFinally(){
        system.debug('--- andFinally called');      
    }
}
