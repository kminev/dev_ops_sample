public class OppourtunityTriggerHandlerFrmwork extends TriggerHandler {

    private Map<Id, Account> accsToUpdate = null;
    public static Savepoint sp = null;
    public static String strAccId;
    public static Datetime dtTemp;

    public OppourtunityTriggerHandlerFrmwork() {

        //URL currentURL = URL.getCurrentRequestUrl();
        //System.Debug('*** URL: ' +  currentURL);
        //URL comparisonURL = new URL(URL.getSalesforceBaseUrl().toExternalForm() + Page.AccountTestPage.getUrl());
        //System.Debug('*** comparisonURL: ' + comparisonURL);
        //boolean knownPath = currentURL.getPath() == comparisonURL.getPath();
        //System.Debug('*** knownPath: ' + knownPath);

        if (this.accsToUpdate != null) {
            this.accsToUpdate = new Map<Id, Account>([SELECT Id, Name FROM Account]);
        }
    }

    public override void beforeInsert() {
        //OppourtunityTriggerHandlerFrmwork.sp = Database.setSavepoint();

        System.Debug('NOW in BEFORE insert');
        System.Debug('*** firstAccountName: ' + MyStaticClass.firstAccountName());

        OppourtunityTriggerHandlerFrmwork.dtTemp = Datetime.now();
        Account acc = new Account(Name = 'Test_Name:' + dtTemp.formatLong());
        insert acc;

        OppourtunityTriggerHandlerFrmwork.strAccId = acc.Id;
    }

    public override void afterInsert() {
        System.Debug('NOW in AFTER insert');
        System.Debug('*** firstAccountName: ' + MyStaticClass.firstAccountName());

        System.Debug('*** AFTER INSERT OppourtunityTriggerHandlerFrmwork.strAccId: ' + OppourtunityTriggerHandlerFrmwork.strAccId);

        String failVar = null;

        //try {
        //System.debug('Before code failure...');
        //failVar.contains('test');
        //} catch (Exception ex) {
        // System.Debug('failVar failed as expected rolling back db');
        //}

        //List<Account> accs = [SELECT Id From Account where id = :OppourtunityTriggerHandlerFrmwork.strAccId];
        //System.debug('OppourtunityTriggerHandlerFrmwork.strAccId after rollback (it should be null): ' + accs);
        System.Debug('now we should get in recursive behavior');
    }

    public override void beforeUpdate() {
        System.Debug('IN BEFORE UPDATE');
        System.Debug('*** firstAccountName: ' + MyStaticClass.firstAccountName());

        String failVar = null;
        try {
            System.Debug('transaction will fail');
            failVar.contains('test');
        } catch (Exception ex) {
            throw new MyException('TEST EXCEPTION');
        }

    }

    public override void afterUpdate() {
        System.Debug('IN AFTER UPDATE');
        System.Debug('*** firstAccountName: ' + MyStaticClass.firstAccountName());
    }

    public class MyException extends Exception {}

}