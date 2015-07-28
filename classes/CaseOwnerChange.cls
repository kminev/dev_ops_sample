public class CaseOwnerChange {
		
	public static void checkQueue(Case[] newCases, Case[] oldCases) {
	
		String queueId = '00G80000001RjBoEAK';//queue/group ID (MyQueue)
		Integer mins = 5;
		datetime dtNow = datetime.now();

		//Get all users
		GroupMember[] usersInGroup = [select UserOrGroupId from GroupMember where GroupId = '00G80000001RjBoEAK'];
		
		User[] users;
				
		for(Integer i=0; i < usersInGroup.size(); i++){
			//users[i] = [select Id from User where Id = :usersInGroup[i].UserOrGroupId];
		}
		
		for (Integer i = 0; i < newCases.size(); i++) {
	
			datetime dtCreatedCase = newCases[i].createddate;
			if(newCases[i].OwnerId == queueId && newCases[i].CreatedDate >  dtCreatedCase.addMinutes(mins)){
				newCases[i].OwnerId = [select Id from User where Id = '00580000001mg9WAAQ'].Id ;
				newCases[i].Description = 'Description Updated';
				update newCases[i];	
			}
		}
		
	}	
}