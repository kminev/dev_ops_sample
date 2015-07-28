public class MyStaticClass {
	

	//NEW CHANGE
	//another change goes in here
	//another change for the new feature branch
	private static List<Account> accounts;

	static{
		System.Debug('*** Now in static block');

		MyStaticClass.accounts = [SELECT Id, Name FROM Account];
	}

	public static String firstAccountName() {
		System.Debug('*** now in firstAccountName()');
		if (MyStaticClass.accounts != null) {
			return MyStaticClass.accounts[0].Name;
		}else {
			return null;
		}

	}

	@future
	public static void myAtFutureTest(){

		System.Debug('*** Now in @future methods');
		insert new Account(Name = 'AtFutureAccount:' + System.now());
	}

	public static void changeMyMaps(Map<Id, Account> newMap, Map<Id, Account> oldMap) {

		for (Account accNew :newMap.values()) {
			try {
				accNew.ParentId = oldMap.get(accNew.Id).ParentId;
			}catch (Exception ex) {
				System.Debug('*** exception in loop: ' + ex.getMessage());
				continue;
			}
		}

	}


}