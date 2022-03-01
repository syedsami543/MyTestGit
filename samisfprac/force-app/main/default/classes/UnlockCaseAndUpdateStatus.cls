public class UnlockCaseAndUpdateStatus {
    @InvocableMethod(label='Unlock and Close Case' description='This used to unlock and close the case')
    public static List<returnResponse> unlockCase(List<casetounlock> casestoUnlock){
        returnResponse r = new returnResponse();
        casetounlock c = casestoUnlock[0]; 
        if(Approval.isLocked(c.caseid)){
            System.debug('Case is Locked');
            if(c.status == 'Check'){	
                r.msg = 'true';
            }
            if(c.status == 'Closed'){
                List<Case> lockedcases = [Select Id,CaseNumber from Case where Id=:c.caseid];
                List<Approval.UnlockResult> ulrList = Approval.unlock(lockedcases, false);
                for(Approval.UnlockResult  ulr : ulrList) {
                    if (ulr.isSuccess()) {
                        //Operation was successful, so get the ID of the record that was processed
                        System.debug('Successfully unlocked case with ID: ' + ulr.getId());
                        lockedcases[0].Status = 'Closed';
                        rejectProcess(lockedcases[0].Id);
                        update lockedcases;
                        r.msg = 'Successfully unlocked and closed case:'+lockedcases[0].CaseNumber;
                    }
                    else {
                        //Operation failed, so get all errors                
                        for(Database.Error err : ulr.getErrors()) {
                            System.debug('The following error has occurred.'); 
                            System.debug(err);
                            System.debug(err.getStatusCode() + ': ' + err.getMessage());
                            System.debug('Case fields that affected this error: ' + err.getFields());
                            r.msg = 'Case fields that affected this error: ' + err.getFields();
                        }
                    }
                }
            }
        }else{
            r.msg = 'This case is not Locked';
        }
        List<returnResponse> rcoll = new List<returnResponse>();
        rcoll.add(r);
        return rcoll;
    }
    public static void rejectProcess(String caseId){
        ProcessDefinition pd;
        Set<Id> pInstanceWorkitems;
        Set<Id> pIds;
        if(Test.isRunningTest()){
            pInstanceWorkitems = (new Map<Id, ProcessInstanceWorkitem>([SELECT Id,ProcessInstanceId FROM ProcessInstanceWorkitem])).keySet();
		}else{
             pd = [SELECT Id FROM ProcessDefinition WHERE DeveloperName = 'Rush_request_Approvals'];
             pIds = (new Map<Id, ProcessInstance>([SELECT Id,Status,TargetObjectId FROM ProcessInstance where Status='Pending' and TargetObjectId =:caseId and ProcessDefinitionId=:pd.Id ])).keySet();
        	 pInstanceWorkitems = (new Map<Id, ProcessInstanceWorkitem>([SELECT Id,ProcessInstanceId FROM ProcessInstanceWorkitem WHERE ProcessInstanceId in :pIds])).keySet();
        }
        List<Approval.ProcessWorkitemRequest> allReq = new List<Approval.ProcessWorkitemRequest>(); 
        for (Id pInstanceWorkitemsId:pInstanceWorkitems){
            system.debug(pInstanceWorkitemsId);
            Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
            req2.setComments('This case not need any approval/rejection.');
            req2.setAction('Reject'); //to approve use 'Approve'
            req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});
            // Use the ID from the newly created item to specify the item to be worked
            req2.setWorkitemId(pInstanceWorkitemsId);
            // Add the request for approval
            allReq.add(req2);
        }
        Approval.ProcessResult[] result2 =  Approval.process(allReq);
    }
    public class casetounlock{
        @InvocableVariable(required=true)
        public String caseId;
        @InvocableVariable(required=true)
        public String status;
    }
    public class returnResponse{
        @InvocableVariable(required=true)
        public String msg;
    }
}