var iliad = function() {

	var hash = "";
	var hashIframe = null;

	var hasActionUrl = function(anchor) {
		if(anchor && jQuery(anchor).attr('href')) {
			return /_action?=(.*)$/.test(jQuery(anchor).attr('href'));
		}
	};

	var setHashLocation = function(hashString) {
		hash = hashString;
		window.location.hash = hash;
	};

	var getHashLocation = function() {
		return window.location.hash.substr(1);
	};

	var getFormActionUrl = function(form) {
		return jQuery(form).attr('action')
	};

	var processUpdates = function(json) {
		
		/* handle redirect if any */
		if(json.redirect) {
			return window.location.href = json.redirect
		}
		
		/* Refresh if there is no widget to update 
		(session expired or the action is invalid) */
		if(sizeOf(json.widgets) == 0) {
			return window.location.reload()
		} 

		/* else update dirty widgets */
		var dirtyWidgets = json.widgets;
		for(var i in dirtyWidgets) {
			updateWidget(i, dirtyWidgets[i]);
		}

		/* evaluate scripts */
		var scripts = json.scripts;
		for(var i in scripts) {
			evalScript(scripts[i]);
		}
	};

	var updateWidget = function(id, contents) {
		jQuery("#"+id).replaceWith(contents)
	};

	var evalScript = function(script) {
		try {eval(jQuery(script).html())}
		catch(e){}
	};

	var insertAjaxLoader = function() {
	jQuery('body').append(
		"<div class='ajax_loader'" +
		"style='position: fixed; top: 10px; right: 10px; z-index: 9999'>" +
		"<img src='/images/ajax_loader.gif'/></div>")
	};

	var showError = function(actionUrl){
		jQuery("body").html("<h1>Error 500: Internal server error</h1>")
	};

	var removeAjaxLoader = function() {
		jQuery(".ajax_loader").replaceWith("");
	};

	var sizeOf = function(obj) {
		var size = 0, key;
		for (key in obj) {
			if (obj.hasOwnProperty(key)) size++;
		}
	return size;
	};


	return {

		evaluateAnchorAction: function(anchor, hashString) {
			var actionUrl = jQuery(anchor).attr('href');
			if(hashString) {
				setHashLocation(hashString)
			}
			this.evaluateAction(actionUrl);
		},

		evaluateFormAction: function(form) {
			var actionUrl = getFormActionUrl(form);
			var data = jQuery(form).serialize();
			this.evaluateAction(actionUrl, "post", data);
		},
		evaluateFormElementAction: function(formElement) {
			var form = jQuery(formElement).closest("form");
			this.evaluateFormAction(form);
		},
	
		enableSubmitAction: function(button) {
			var name = jQuery(button).attr("name");
			if(name) {
				var hidden = 
					"<input type='hidden' name='" + name + "'></input>";
				var form = jQuery(button).closest("form");
				jQuery(form).append(hidden);
			}
		},

		evaluateAction: function(actionUrl, method, data) {
			if(!method) {method = 'get'}
			jQuery.ajax({
				url: actionUrl,
				type: method,
				processUpdates: true,
				dataType: 'json',
				data: data,
				beforeSend: function(xhr) {
					xhr.setRequestHeader("X-Requested-With", ""); 
					insertAjaxLoader()},
				success: function(json) {
					processUpdates(json);
					removeAjaxLoader();
				},
				error: function(err) {
					showError(actionUrl);
				}
			});
		},
		
		checkHashChange: function() {
			var newHash = getHashLocation();
			if(hash != newHash) {
				hash = newHash;
				jQuery.ajax({
					url: window.location.pathname + '?_hash=' + hash,
					dataType: "html",
					beforeSend: function(xhr) {
					xhr.setRequestHeader("X-Requested-With", ""); 
						insertAjaxLoader();
					},
					success: function(response) {
						var extractor = /<body[^>]*>((.|\s)*)<\/body>/;
						jQuery("body").html(extractor.exec(response)[1]);
						removeAjaxLoader();
					}
				});
			}
		},

	}
}();



jQuery(document).ready(function() {
	setInterval("iliad.checkHashChange()", 200);
});


