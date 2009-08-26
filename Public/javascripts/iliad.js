/* ====================================================================
|
|   iliad.js
|
 ======================================================================

 ======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| This file is part of the Iliad framework.
|
| Permission is hereby granted, free of charge, to any person obtaining
| a copy of this software and associated documentation files (the 
| 'Software'), to deal in the Software without restriction, including 
| without limitation the rights to use, copy, modify, merge, publish, 
| distribute, sublicense, and/or sell copies of the Software, and to 
| permit persons to whom the Software is furnished to do so, subject to 
| the following conditions:
|
| The above copyright notice and this permission notice shall be 
| included in all copies or substantial portions of the Software.
|
| THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
|
 ==================================================================== */



var iliad = function() {


	/* ---
	 * Variables
	 * -------------------------------------------------------------- */
	
	var hash           = "";
	var iframe         = null;
	var actionsLocked  = false;
	var ie67           = false;
	

	/* ---
	 * Initialization
	 * -------------------------------------------------------------- */

	var initialize = function() {
		ie67 = jQuery.browser.msie && parseInt(jQuery.browser.version) < 8;
		if(ie67) {
			var iDoc = jQuery("<iframe id='_iliad_ie_history_iframe'" +
				"src='/iliad_ie_history.html'" +
				"style='display: none'></iframe>").prependTo("body")[0];
			iframe = iDoc.contentWindow.document || iDoc.document;
			if(window.location.hash) {
				hash = window.location.hash.substr(1);
				iframe.location.hash = hash;
				evaluateAction(window.location.pathname + '?_hash=' + hash);
			}
			//iframe.open();
			//iframe.close();
			iframe.location.title = window.title;
		}
		checkHashChange();
	};


	/* ---
	 * Action evaluation
	 * -------------------------------------------------------------- */

	var evaluateAnchorAction = function(anchor, hashString) {
		var actionUrl = jQuery(anchor).attr('href');
		this.evaluateAction(actionUrl);
		if(hashString) {
			setHash(hashString)
		}
	};

	var evaluateFormAction = function(form) {
		var actionUrl = getFormActionUrl(form);
		var data = jQuery(form).serialize();
		this.evaluateAction(actionUrl, "post", data);
	};

	var evaluateFormElementAction = function(formElement) {
		var form = jQuery(formElement).closest("form");
		this.evaluateFormAction(form);
	};

	var enableSubmitAction = function(button) {
		var name = jQuery(button).attr("name");
		if(name) {
			var hidden = 
				"<input type='hidden' name='" + name + "'></input>";
			var form = jQuery(button).closest("form");
			jQuery(form).append(hidden);
		}
	};

	var evaluateAction = function(actionUrl, method, data) {
		if(!actionsLocked) {
			if(!method) {method = 'get'}
			lockActions();
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
					unlockActions();
				},
				error: function(err) {
					showError(actionUrl);
					unlockActions();
				}
			});
		}
	};

	var lockActions = function() {
		actionsLocked = true;
	};

	var unlockActions = function() {
		actionsLocked = false;
	};

	var hasActionUrl = function(anchor) {
		if(anchor && jQuery(anchor).attr('href')) {
			return /_action?=(.*)$/.test(jQuery(anchor).attr('href'));
		}
	};

	var getFormActionUrl = function(form) {
		return jQuery(form).attr('action')
	};


	/* ---
	 * Enable bookmarking for ajax actions
	 * and fix the back button
	 * -------------------------------------------------------------- */
	
	var checkHashChange = function() {
		var newHash = getHash();
		if(hash != newHash) {
			hash = newHash;
			if(ie67) {window.location.hash = hash}
			evaluateAction(window.location.pathname + '?_hash=' + hash);
		}
	};

	var setHash = function(hashString) {
		hash = hashString;
		window.location.hash = hash;
		//IE is different, as usual....
        	if(ie67) {fixHistoryForIE()}
	};

	var getHash = function() {
        	if(ie67) {return iframe.location.hash.substr(1)}
		return window.location.hash.substr(1);
	};

	//Special hack for IE < 8. 
	//Else IE won't add an entry to the history
	var fixHistoryForIE = function() {
		//Add history entry
		iframe.open();
		iframe.close();
		iframe.location.hash = hash;
		//iframe.location.title = window.title;
	};


	/* ---
	 * Page updates
	 * -------------------------------------------------------------- */

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


	/* ---
	 * Various
	 * -------------------------------------------------------------- */

	var insertAjaxLoader = function() {
	jQuery('body').append(
		"<div class='ajax_loader'" +
		"style='position: fixed; _position: absolute;" +
		"top: 10px; right: 10px; z-index: 9999'>" +
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


	/* ---
	 * Public API
	 * -------------------------------------------------------------- */

	that = {};
	that.evaluateAnchorAction = evaluateAnchorAction;
	that.evaluateFormAction = evaluateFormAction;
	that.evaluateFormElementAction = evaluateFormElementAction;
	that.evaluateAction = evaluateAction;
	that.enableSubmitAction = enableSubmitAction;
	that.checkHashChange = checkHashChange;
	that.initialize = initialize;

	return that
}();


jQuery(document).ready(function() {
	iliad.initialize();
	setInterval(iliad.checkHashChange, 200);
});

