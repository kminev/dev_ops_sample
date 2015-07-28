/************************************************************************
   @Author       Kiril Minev
   @name         RecursionControl
   @CreateDate   4/15/2014
   @Description  This class handles recursion by managing bypass rules
   				 Class is intended to be inherited for each sobject where recursion bypass mechanism is needed
**************************************************************************/
public without sharing virtual  class RecursionControl {


	/* Entire handler such as OpportunityHandler, AccountHandler, etc. */
	private Set<String> bypassedHandlers;
	/* Custom By Pass Rules Defined as String literals */
	private Set<String> bypassRules;
	/* Trigger Context such as Before Insert, After Insert, Before Update etc. */
	private Set<String> bypassedTriggerContexts;


	public RecursionControl() {
		this.bypassedHandlers = new Set<String>();
		this.bypassRules = new Set<String>();
		this.bypassedTriggerContexts = new Set<String>();
	}

	/* ByPasssedHandlers START */
	public void bypassHandler(String handlerName) {
		this.bypassedHandlers.add(handlerName);
	}

	public Boolean isHandlerBypassed(String handlerName) {
		return this.bypassedHandlers.contains(handlerName);
	}

	public void clearBypassHandler(String handlerName) {
		this.bypassedHandlers.remove(handlerName);
	}
	/* ByPasssedHandlers END */

	/* BypassRules START */
	public void bypassRule(String ruleName) {
		this.bypassRules.add(ruleName);
	}

	public Boolean isBypassRule(String ruleName) {
		return this.bypassRules.contains(ruleName);
	}

	public void clearBypassRule(String ruleName) {
		this.bypassRules.remove(ruleName);
	}

	/* BypassedTriggerContext START */

	public void bypassTriggerContext(TriggerContext context) {
		this.bypassedTriggerContexts.add(context.name());
	}

	public Boolean isTriggerContextBypassed(TriggerContext context) {
		return this.bypassRules.contains(context.name());
	}

	public void clearTriggerContextBypass(TriggerContext context) {
		this.bypassedHandlers.remove(context.name());
	}
	/* BypassedTriggerContext END */

	
	/**
	 * [clearAllBypasses Clears all bypass rules ]
	 * @return {[type]} [description]
	 */
	public void clearAllBypasses() {
		this.bypassedHandlers.clear();
		this.bypassRules.clear();
		this.bypassedTriggerContexts.clear();
	}

	public enum TriggerContext {

		BEFORE_INSERT, BEFORE_UPDATE, BEFORE_DELETE,
		AFTER_INSERT, AFTER_UPDATE, AFTER_DELETE,
		AFTER_UNDELETE
	}

	/**
	 *  TODO: Implement your own enums in the class extending this one
	 *  public enum BypassRule{...}
	 *  public enum BypassHandler {OpportunityHandler, AccountHandler etc ...}
	 */
	

}