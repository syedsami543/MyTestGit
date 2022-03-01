({
	getlstcaserecords: function(component) {
        var action = component.get('c.getcaserecords');
        action.setParams({recordId : component.get("v.recordId")});
      	var self = this;
        action.setCallback(this, function(actionResult) {
        component.set('v.lstCases', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
		
	}
})