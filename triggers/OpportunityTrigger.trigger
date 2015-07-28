trigger OpportunityTrigger on Opportunity (before insert, before update, before delete, after insert, after update, after delete) {

	

	//new OppourtunityTriggerHandlerFrmwork().run();
	//
	//If (Trigger.isBefore && Trigger.isUpdate) {
	/*
			Savepoint sp = Database.setSavepoint();

			try {

				Account acc2 = new Account(Name = 'TestAccc3'); insert acc2;


				MyStaticClass.myAtFutureTest();

				String test = null;
				System.Debug('*** now adding the future call');
				MyStaticClass.myAtFutureTest();
				System.Debug('*** This will fail now');
				test.contains('test');



			} catch (Exception ex) {
				//MyStaticClass.myAtFutureTest();
				System.Debug('*** now handling exception');
				//ex2 = ex;
				//throw ex;
				System.Debug('*** rolling back DB');
				//Database.rollback(sp);

				//((List<Opportunity>)Trigger.new)[0].addError('ERRROR');
			} finally {
				System.Debug('*** now in finally insert acccount');
				insert new Account(Name = 'ZZZZZZZZZZ5555: ' + System.Now());
				throw new CommonException('TEST ');
			}
		}
		*/
	/*
	System.Debug('*** NOW IN TRIGGER MAIN');

	if (Trigger.isBefore && Trigger.isInsert) {

		OpportunityTriggerHandler.IS_INSERTING = true;
		System.Debug('beforeInsert, counter: ' + OpportunityTriggerHandler.someMethod());
	}

	if (Trigger.isAfter && Trigger.isInsert){
		System.Debug('afterInsert, counter: ' + OpportunityTriggerHandler.someMethod());
	}

	if (Trigger.isUpdate) {
		System.Debug('IN TRIGGER UPDATE EVENT');
		if (!OpportunityTriggerHandler.IS_INSERTING) {
			SYstem.Debug('RUN UDPATE LOGIC');
		} else {
			System.Debug('IGNORE UPDATE LOGIC');
		}
	}
	*/
	/*
	class CommonException extends Exception {

	}
	*/

}