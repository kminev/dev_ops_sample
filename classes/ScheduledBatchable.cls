global class ScheduledBatchable implements Schedulable {
	global void execute(SchedulableContext sc) {
		// Implement any logic to be scheduled

		// We now call the batch class to be scheduled
		ExampleBatchClass b = new ExampleBatchClass();

		//Parameters of ExecuteBatch(context,BatchSize)
		database.executebatch(b, 10);
	}
}

/*
String CRON_EXP = '0 0 * * * ?';
SheduledBatchable sch = new scheduledBatchable();
system.schedule('Hourly Example Batch Schedule job', CRON_EXP, sch);
*/