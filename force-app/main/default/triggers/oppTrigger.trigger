trigger oppTrigger on Opportunity(after insert, after update, after delete, after undelete, before delete){
	switch on Trigger.OperationType {
		when After_Insert{
			OppTriggerHandler.calculateMaxOppOnAcc(Trigger.New, NULL);
		}
		when After_Update{
			OppTriggerHandler.calculateMaxOppOnAcc(Trigger.New, Trigger.OldMap);
		}
		when After_Delete{
			OppTriggerHandler.calculateMaxOppOnAcc(Trigger.old, NULL);
            OppTriggerHandler.AfterShowData(Trigger.new, Trigger.old);
		}
		when After_Undelete{
			OppTriggerHandler.calculateMaxOppOnAcc(Trigger.New, NULL);
		}	
        when Before_Delete{
            OppTriggerHandler.BeforeShowData(Trigger.new, Trigger.old);
		}
	}
}