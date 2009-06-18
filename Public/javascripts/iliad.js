var Iliad = {

	/* Public */
	
	evaluateAnchorAction: function(anchor) {
		var actionUrl = jQuery(anchor).attr('href');
		this.evaluateAction(actionUrl);
	},

	evaluateFormAction: function(form) {
		var actionUrl = this._getFormActionUrl(form);
		var data = jQuery(form).serialize();
		this.evaluateAction(actionUrl, "post", data);
	},
	
	enableSubmitAction: function(button) {
		var name = jQuery(button).attr("name");
		if(name) {
			var hidden = "<input type='hidden' name='" + name + "'></input>";
			var form = jQuery(button).closest("form");
			jQuery(form).append(hidden);
		}
	},

	evaluateAction:function(actionUrl, method, data) {
		if(!method) {method = 'get'};
		var that = this;
		jQuery.ajax({
		url: actionUrl,
			type: method,
			processUpdates: true,
			dataType: 'json',
			data: data,
			beforeSend: function(xhr) {
			xhr.setRequestHeader("X-Requested-With", ""); 
			Iliad._insertAjaxLoader()},
			success: function(json) {
				that._processUpdates(json);
				that._removeAjaxLoader();
			},
			error: function(err) {
				that._showError(actionUrl);
			}
		});
	},
	

	/* Private */
	
	_hasActionUrl:function(anchor) {
		if(anchor && jQuery(anchor).attr('href')) {
			return /action?=(.*)$/.test(jQuery(anchor).attr('href'));
		}
	},
	
	_getFormActionUrl:function(form) {
		return jQuery(form).attr('action')
	},

	_processUpdates:function(json) {
		/* handle redirect if any */
		if(json["redirect"]) {
			window.location.href = json["redirect"]
		}
	
		/* else update dirty widgets */
		var dirtyWidgets = json['widgets'];
		for(var i in dirtyWidgets) {
			this._updateWidget(i, dirtyWidgets[i]);
		}

		/* evaluate scripts */
		var scripts = json['scripts'];
		for(var i in scripts) {
			this._evalScript(scripts[i]);
		}
	},
	
	_updateWidget:function(widget, contents) {
		jQuery("#"+widget).replaceWith(contents)
	},

	_evalScript:function(script) {
		try {eval(jQuery(script).html())}
		catch(e){}
},

	_insertAjaxLoader:function() {
		jQuery('body').append('<div class="ajax_loader" style="position: fixed; top: 10px; right: 10px; z-index: 9999"><img src="/images/ajax_loader.gif"/></div>')
	},

	_showError:function(actionUrl){
		jQuery("body").html("<h1>Error 500: Internal server error</h1>")
	},

	_removeAjaxLoader:function() {
		jQuery(".ajax_loader").replaceWith("");
	}
}
