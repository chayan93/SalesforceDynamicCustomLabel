({
	doInit : function(component) {
		var action = component.get("c.getDynamicCustomLabel");
        action.setParams({labelToFetch : component.get("v.customLabelAPIName")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.customLabelValue", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})