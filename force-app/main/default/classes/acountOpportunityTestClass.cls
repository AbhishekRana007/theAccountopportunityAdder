@istest
public with sharing class acountOpportunityTestClass {
     
    @isTest
   public static void  acountOpportunityTestClass1() {
                //This is to Activate custom Setting.
                TriggerConfig__c triggerConfig =new TriggerConfig__c();
                triggerConfig.Name='Opportunity';
                triggerConfig.IsActive__c=true;
                triggerConfig.ApexHandler__c='AccountOpportunityHandler';
                triggerConfig.SkipForUsers__c=null;
                
                
                insert triggerConfig;
                
                // TriggerConfig__c   setting = TriggerConfig__c.getValues('Contact');
        
                test.startTest();
                account acc=new account();
                acc.name='testClassOppo';
                insert acc;
                list<Opportunity> conList=new list<Opportunity>();
                for(integer i=0;i<205;i++){
                   conList.add(new Opportunity(Name='news'+i,CloseDate=system.today(),AccountId=acc.Id,StageName='Prospecting'));
                }
                insert conList;
                test.stopTest();
                list<Opportunity> incon=[select name,id from Opportunity where name like 'news%'];
                system.assertequals(205,incon.size());
            }
    
    @istest
     public static void  acountOpportunityUpdateTestClass1() {
                //This is to Activate custom Setting.
                TriggerConfig__c triggerConfig =new TriggerConfig__c();
                triggerConfig.Name='Opportunity';
                triggerConfig.IsActive__c=true;
                triggerConfig.ApexHandler__c='AccountOpportunityHandler';
                triggerConfig.SkipForUsers__c=null;
                
                
                insert triggerConfig;
                
                // TriggerConfig__c   setting = TriggerConfig__c.getValues('Contact');
        
                
                account acc=new account();
                acc.name='testClassOppo';
                insert acc;
                list<Opportunity> conList=new list<Opportunity>();
                for(integer i=0;i<205;i++){
                   conList.add(new Opportunity(Name='news'+i,CloseDate=system.today(),AccountId=acc.Id,StageName='Prospecting'));
                }
                insert conList;
               
                list<Opportunity> incon=[select name,id from Opportunity where name like 'news%'];
                for(Opportunity opp:incon){
                 opp.StageName='Qualification';
                }  
                test.startTest();
               update incon;
               test.stopTest();
                system.assertequals(205,incon.size());
         
       
            }
    
    @istest
     public static void  acountOpportunityDeleteTestClass1() {
                //This is to Activate custom Setting.
                TriggerConfig__c triggerConfig =new TriggerConfig__c();
                triggerConfig.Name='Opportunity';
                triggerConfig.IsActive__c=true;
                triggerConfig.ApexHandler__c='AccountOpportunityHandler';
                triggerConfig.SkipForUsers__c=null;
                
                
                insert triggerConfig;
                
                // TriggerConfig__c   setting = TriggerConfig__c.getValues('Contact');
        
                
                account acc=new account();
                acc.name='testClassOppo';
                insert acc;
                list<Opportunity> conList=new list<Opportunity>();
                for(integer i=0;i<205;i++){
                   conList.add(new Opportunity(Name='newsopps',CloseDate=system.today(),AccountId=acc.Id,StageName='Prospecting'));
                }
                insert conList;
               
                list<Opportunity> incon=[select name,id from Opportunity where name='newsopps'];
                 test.startTest();
                 delete incon;
                //List<Database.DeleteResult> deleteResultList = Database.delete(incon, false);
                 test.stopTest();
                system.assertequals(0,incon.size());
         
       
            }
    }