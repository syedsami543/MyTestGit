({
	handleClick : function(component, event, helper) {
         var searchval = component.find("searchvalue").get("v.value");
		var action = component.get("c.displayAccounts1");
        action.setParams({ param:searchval });
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                alert ('accounts fetched successfully');
                var returnvalue = response.getReturnValue();
                component.set('v.lstaccounts',returnvalue);
                }
            else if (state === "ERROR") {
                alert ('Failure');

            }
        });
        $A.enqueueAction(action);

	}
})