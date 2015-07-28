trigger AccountTrigger on Account (before update, after update, before insert, after insert) {


	if (Trigger.isInsert && Trigger.isBefore) {

		//AccountTriggerHandler.getInstance().beforeInsert(Trigger.new);
		System.Debug('IN BEFORE INSERT');
		for (Account acc :Trigger.new) {
			System.Debug(' acc: ' + acc.My_Test_Auto_Number__c);
		}

	} else if (Trigger.isInsert && Trigger.isAfter) {

		//AccountTriggerHandler.getInstance().afterInsert(Trigger.newMap);
		System.Debug('IN AFTER INSERT');
		for (Account acc :Trigger.new) {
			System.Debug(' acc: ' + acc.My_Test_Auto_Number__c);
			acc.My_Text_Field__c = acc.My_Test_Auto_Number__c;
		}

	} else if (Trigger.isUpdate && Trigger.isBefore) {

		//AccountTriggerHandler.getInstance().beforeUpdate(Trigger.newMap, Trigger.oldMap);

	} else if (Trigger.isUpdate && Trigger.isAfter) {

		//AccountTriggerHandler.getInstance().afterUpdate(Trigger.newMap, Trigger.oldMap);

	}
}