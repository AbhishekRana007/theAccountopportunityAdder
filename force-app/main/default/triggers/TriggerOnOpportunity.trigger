trigger TriggerOnOpportunity on Opportunity (before insert,after Insert,before Delete,after Delete,before update,after update) {

    TriggerFactory.initiateHandler(Opportunity.sObjectType);

}