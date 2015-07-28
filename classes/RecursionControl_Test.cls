/************************************************************************
   @Author       Kiril Minev
   @name         RecursionControl
   @CreateDate   4/15/2014
   @Description  This class handles recursion by managing bypass rules
   				 Class is intended to be inherited for each sobject where recursion bypass mechanism is needed
**************************************************************************/
@isTest
private class RecursionControl_Test {

	@isTest
	static void testBypassHandlers() {

		Test.startTest();

		String handlerTest1 = 'HANDLER_BYPASS_TEST_1';
		String handlerTest2 = 'HANDLER_BYPASS_TEST_2';

		RecursionControl recursionObj = new RecursionControl();

		recursionObj.bypassHandler(handlerTest1);
		recursionObj.bypassHandler(handlerTest2);

		System.assertEquals(true, recursionObj.isHandlerBypassed(handlerTest1), 'Bypass handler rule [' + handlerTest1 + '] was expected to return true.');
		System.assertEquals(true, recursionObj.isHandlerBypassed(handlerTest2), 'Bypass handler rule [' + handlerTest2 + '] was expected to return true.');
		System.assertEquals(false, recursionObj.isHandlerBypassed('NEGATIVE_TEST_CASE'), 'This test is suppose to return false as this bypass handler has not been engaged.');

		recursionObj.clearBypassHandler(handlerTest1);

		System.assertEquals(false, recursionObj.isHandlerBypassed(handlerTest1), 'Bypassed handler [' + handlerTest1 + '] was cleared.');

		recursionObj.clearAllBypasses();

		System.assertEquals(false, recursionObj.isHandlerBypassed(handlerTest2), 'All bypass handlers were cleared.');

		Test.stopTest();
	}

	@isTest
	static void testBypassRules() {

		Test.startTest();

		String bypassRuleTest1 = 'RULE_BYPASS_TEST_1';
		String bypassRuleTest2 = 'RULE_BYPASS_TEST_2';

		RecursionControl recursionObj = new RecursionControl();

		recursionObj.bypassRule(bypassRuleTest1);
		recursionObj.bypassRule(bypassRuleTest2);

		System.assertEquals(true, recursionObj.isBypassRule(bypassRuleTest1), 'Bypass rule [' + bypassRuleTest1 + '] was expected to return true.');
		System.assertEquals(true, recursionObj.isBypassRule(bypassRuleTest2), 'Bypass rule [' + bypassRuleTest2 + '] was expected to return true.');
		System.assertEquals(false, recursionObj.isBypassRule('NEGATIVE_TEST_CASE'), 'This test is suppose to return false as this bypass handler has not been engaged.');

		recursionObj.clearBypassRule(bypassRuleTest1);

		System.assertEquals(false, recursionObj.isBypassRule(bypassRuleTest1), 'Bypassed rule [' + bypassRuleTest1 + '] was cleared.');

		recursionObj.clearAllBypasses();

		System.assertEquals(false, recursionObj.isBypassRule(bypassRuleTest2), 'All bypass rules were cleared.');

		Test.stopTest();

	}

	@isTest
	static void testBypassedTriggerContexts() {

		Test.startTest();

		RecursionControl recursionObj = new RecursionControl();

		recursionObj.bypassTriggerContext(RecursionControl.TriggerContext.BEFORE_INSERT);
		recursionObj.bypassTriggerContext(RecursionControl.TriggerContext.AFTER_INSERT);

		System.assertEquals(true, recursionObj.isTriggerContextBypassed(RecursionControl.TriggerContext.BEFORE_INSERT), 'Bypass trigger context [' + RecursionControl.TriggerContext.BEFORE_INSERT.name() + '] was expected to return true.');
		System.assertEquals(true, recursionObj.isTriggerContextBypassed(RecursionControl.TriggerContext.AFTER_INSERT), 'Bypass trigger context [' + recursionControl.TriggerContext.AFTER_INSERT.name() + '] was expected to return true.');
		System.assertEquals(false, recursionObj.isTriggerContextBypassed(RecursionControl.TriggerContext.BEFORE_UPDATE), 'This test is suppose to return false as this bypass handler has not been engaged.');

		recursionObj.clearTriggerContextBypass(RecursionControl.TriggerContext.BEFORE_INSERT);

		System.assertEquals(false, recursionObj.isTriggerContextBypassed(RecursionControl.TriggerContext.BEFORE_INSERT), 'Bypassed trigger context [' + RecursionControl.TriggerContext.BEFORE_INSERT.name() + '] was cleared.');

		recursionObj.clearAllBypasses();

		System.assertEquals(false, recursionObj.isTriggerContextBypassed(RecursionControl.TriggerContext.AFTER_INSERT), 'All bypass rules were cleared.');
		

		Test.stopTest();

	}
}