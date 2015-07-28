trigger POC_Trigger on MY_POC__C (before insert, after insert, before update, after update) {
	System.Debug('I am in MY POC Trigger');
}