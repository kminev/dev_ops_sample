public without sharing class OpportunityRecursionControl extends RecursionControl {

	public enum OPPORTUNITY_BY_PASS_RULE {UPDATE_OPPORTUNITY_NAMES, UPDATE_APPROVERS}
	
	private static OpportunityRecursionControl instance ;

	private OpportunityRecursionControl() {}

	public static OpportunityRecursionControl getInstance() {
		if (instance == null) instance = new OpportunityRecursionControl();

		return instance;
	}

}