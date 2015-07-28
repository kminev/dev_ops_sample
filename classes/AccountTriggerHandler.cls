public with sharing class AccountTriggerHandler {


	private static AccountTriggerHandler instance = null;

	private AccountTriggerHandler() {

	}

	public static AccountTriggerHandler getInstance() {
		if (instance == null) instance = new AccountTriggerHandler();

		return instance;

	}

	public void beforeInsert (List<Account> accountsNew) {

	}

	public void afterInsert(Map<Id, Account> accountsNewMap) {

	}

	public void beforeUpdate (Map<Id, Account> newAccountsMap, Map<Id, Account> oldAccountsMap) {

	}

	public void afterUpdate(Map<Id, Account> newAccountsMap, Map<Id, Account> oldAccountsMap) {

		OpportunityRecursionControl.getInstance().bypassRule(
		    OpportunityRecursionControl.OPPORTUNITY_BY_PASS_RULE.UPDATE_OPPORTUNITY_NAMES.name()
		);

		updateOpportunityNamesForAccount(newAccountsMap);
		
		OpportunityRecursionControl.getInstance().clearBypassRule(
		    OpportunityRecursionControl.OPPORTUNITY_BY_PASS_RULE.UPDATE_OPPORTUNITY_NAMES.name()
		);


	}


	private void updateOpportunityNamesForAccount(Map<Id, Account> accountsMap) {

		List<Opportunity> opportunities = [SELECT Name FROM Opportunity WHERE AccountId IN :accountsMap.keySet()];

		for (Opportunity o : opportunities) {
			o.Name = o.Name + ' - ' + System.now();
		}

		update opportunities;

	}
}