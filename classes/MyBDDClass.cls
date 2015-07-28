@isTest
private class MyBDDClass
{
	@isTest
	static void itShould()
	{
		// Given


		// When

		Integer num = -1;

		// Then
		System.Debug('Before test, limit.queries: ' + Limits.getQueries());
		Test.startTest();

		System.Debug('in test, limit.queries: ' + Limits.getQueries());

		Account acc = new Account(Name = 'test');
		insert acc;

		System.Debug('After account insert, limit.queries: ' + Limits.getQueries());

		num = Limits.getQueries();

		Test.stopTest();

		System.Debug('After testStop, limit.queries: ' + Limits.getQueries());

		insert new Account(Name = 'Test: ' + num);

		 Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // CONFIGURE MAIL
        mail.setToAddresses(new String[]{'kirilminev@yahoo.com'}); 
        mail.setPlainTextBody('test');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

	}
}