global class ExampleBatchClass implements Database.Batchable<sObject>
{
    global ExampleBatchClass(){
              // Batch Constructor
     }
   
     // Start Method
     global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('Select Id From Account limit 100');
     }
   
     // Execute Logic
     global void execute(Database.BatchableContext BC, List<sObject> scope){
            // Logic to be Executed batch wise      
   
     }
   
     global void finish(Database.BatchableContext BC){
   
     }
   
 }

 /*
String CRON_EXP = '0 0 * * * ?';
SheduledBatchable sch = new scheduledBatchable();
system.schedule('Hourly Example Batch Schedule job', CRON_EXP, sch);
*/