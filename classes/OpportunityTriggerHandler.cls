public with sharing class OpportunityTriggerHandler {


	private static OpportunityTriggerHandler instance = null;

	private OpportunityTriggerHandler() {

	}

	public static OpportunityTriggerHandler getInstance() {
		if (instance == null) instance = new OpportunityTriggerHandler();

		return instance;

	}

	public void beforeInsert (List<Opportunity> opportunitiesNew) {

	}

	public void afterInsert(Map<Id, Opportunity> opportunitiesNewMap) {

	}

	public void beforeUpdate (Map<Id, Opportunity> newOpportunitiesMap, Map<Id, Opportunity> oldOpportunitiesMap) {

		if (OpportunityRecursionControl.getInstance().isBypassRule(OpportunityRecursionControl.OPPORTUNITY_BY_PASS_RULE.UPDATE_OPPORTUNITY_NAMES.name())) {
			updateOpportunityType(newOpportunitiesMap);
		}
	}

	public void afterUpdate(Map<Id, Opportunity> newOpportunitiesMap, Map<Id, Opportunity> oldOpportunitiesMap) {

	}

	private void updateOpportunityType(Map<Id, Opportunity> opportunitiesMap) {

		for (Opportunity opp :opportunitiesMap.values()) {
			opp.Type = 'TEST_TYPE';
		}
	}
}