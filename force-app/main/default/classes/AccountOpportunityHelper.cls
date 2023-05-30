public with sharing class AccountOpportunityHelper {
  
public static map<id,string> bulkOpportunity(list<Opportunity>allOpportunities){
map<id,string> allOpportunitiesAccountsmap =new map<id,string>();
set<id> accids=new Set<id>();

for(Opportunity oops:allOpportunities){
  accids.add(oops.accountID);
}

list<Account> selectedAccounts=[select name,id from Account where id in :accids];

for(Account a:selectedAccounts){
  allOpportunitiesAccountsmap.put(a.ID,a.Name);
}
system.debug('hello world');
return allOpportunitiesAccountsmap;

}
 system.debug('hello git');
    public static void accountCreater(map<id,string> maping,Opportunity so){

      if(maping.containskey(so.accountID)){
        so.name=so.name+' '+maping.get(so.accountID);
      }

        } }
    
