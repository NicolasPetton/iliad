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


var iliad = (function() {


	/* ---
	 * Variables
	 * -------------------------------------------------------------- */
	
	var hash           = "";
	var actionsLocked  = false;
	var ie67           = false;
	var ajaxLoader     = false;
	

	/* ---
	 * Initialization
	 * -------------------------------------------------------------- */

	function initialize() {
		ie67 = jQuery.browser.msie && parseInt(jQuery.browser.version) < 8;
		if(ie67) {
			var iDoc = jQuery("<iframe id='_iliad_ie_history_iframe'" +
				"src='/javascripts/iliad_ie_history.html'" +
				"style='display: none'></iframe>").prependTo("body")[0];
			var iframe = iDoc.contentWindow.document || iDoc.document;
			if(window.location.hash) {
				hash = window.location.hash.substr(1);
				iframe.location.hash = hash;
				evaluateAction(window.location.pathname + '?_hash=' + hash);
			}
			iframe.location.title = window.title;
		}
		checkHashChange();
		enableAjaxActions()
	}

	function enableAjaxActions() {
		jQuery(document).click(function(event) {
			var anchor = jQuery(event.target).closest("a");
			if(anchor.length == 1) {
				if(hasActionUrl(anchor)) {
					evaluateAnchorAction(anchor, event);
				}
			}
			var button = jQuery(event.target).closest("button");
			if(button.length == 1) {
				enableSubmitAction(button);
				evaluateFormElementAction(button, event);
			}

		})
	}
	

	/* ---
	 * Action evaluation
	 * -------------------------------------------------------------- */

	 function evaluateAnchorAction(anchor, event) {
		if(hasActionUrl(anchor)) {
			var actionUrl = jQuery(anchor).attr('href');
			evaluateAction(actionUrl);
			if(hasHashUrl(anchor)) {
				setHash(hashUrl(anchor));
			};
			event.preventDefault();
		}
	}

	function evaluateFormElementAction(formElement, event) {
		var form = jQuery(formElement).closest("form");
		if(isMultipart(form)) {
			evaluateMultipartFormAction(form);
		} else {
			evaluateFormAction(form);
			event.preventDefault();
		}
	}

	function enableSubmitAction(button) {
		var name = jQuery(button).attr("name");
		if(name) {
			var hidden = "<input type='hidden' name='" + 
				name + "'></input>";
			var form = jQuery(button).closest("form");
			jQuery(form).append(hidden);
		}
	}

	function evaluateFormAction(form) {
		var actionUrl = getFormActionUrl(form);
		var data = jQuery(form).serialize();
		evaluateAction(actionUrl, "post", data);
	}

	function evaluateMultipartFormAction(form) {
		if(!actionsLocked) {
			var hidden = "<input type='hidden' name='_ajax_upload'></input>";
			var upload_target = jQuery('#_upload_target');
			if(upload_target.size() == 0) {
				upload_target = jQuery(
					"<iframe id='_upload_target' name='_upload_target' " +
					"src='#' style='display:none'></iframe>");
				upload_target.appendTo('body');
			}
			upload_target.one('load', function(e) {
				evaluateAction('?_state='+jQuery(form).find('input[name=_state]').val());
			});
			jQuery(form).append(hidden);
			jQuery(form).attr('target', '_upload_target');
			startUpload(form);
		}
		else {return false}
	}


	function evaluateAction(actionUrl, method, data, lock) {
		if(!actionsLocked) {
			if(!method) method = 'get';
			if(lock == null) lock = true;
			if(lock) lockActions();
			jQuery.ajax({
				url: actionUrl,
				type: method,
				processUpdates: true,
				dataType: 'json',
				data: data,
				beforeSend: function(xhr) {
					if(ajaxLoader) insertAjaxLoader();},
				success: function(json) {
					processUpdates(json);
					if(ajaxLoader) removeAjaxLoader();
					unlockActions();
				},
				error: function(err) {
					showError(err, actionUrl);
					unlockActions();
				}
			});
		}
	}

	function lockActions() {
		actionsLocked = true;
	}

	function unlockActions() {
		actionsLocked = false;
	}

	function hasActionUrl(anchor) {
		if(anchor && jQuery(anchor).attr('href')) {
			return (/_action?=(.*)$/).test(jQuery(anchor).attr('href'));
		}
	}

	function hasHashUrl(anchor) {
		if(anchor && jQuery(anchor).attr('href')) {
			return (/_hash?=(.*)$/).test(jQuery(anchor).attr('href'));
		}
	}

	function hashUrl(anchor) {
		return /_hash=([^\#|\&]+)/.exec(anchor.attr('href'))[1]
	}

	function isMultipart(form) {
		return jQuery(form).attr('enctype') == "multipart/form-data";
	}

	function getFormActionUrl(form) {
		return jQuery(form).attr('action');
	}


	/* ---
	 * Enable bookmarking for ajax actions
	 * and fix the back button
	 * -------------------------------------------------------------- */
	
	function checkHashChange() {
		var newHash = getHash();
		if(hash != newHash) {
			hash = newHash;
			if(ie67) window.location.hash = hash;
			evaluateAction(window.location.pathname + '?_hash=' + hash);
		}
	}

	function setHash(hashString) {
		hash = hashString;
		window.location.hash = hash;
		//IE is different, as usual....
        	if(ie67) fixHistoryForIE();
	}

	function getHash() {
        	if(ie67) {
			var newHash = getIframe().location.hash;
			return newHash.substr(1);
		}
		return window.location.hash.substr(1);
	}

	function getIframe() {
		return jQuery('#_iliad_ie_history_iframe')[0].contentWindow.document;
	}

	//Special hack for IE < 8. 
	//Else IE won't add an entry to the history
	function fixHistoryForIE() {
		//Add history entry
		getIframe().open();
		getIframe().close();
		getIframe().location.hash = hash;
	}


	/* ---
	 * Page updates
	 * -------------------------------------------------------------- */

	function processUpdates(json) {
		var script_extractor= /<script(.|\s)*?\/script>/ig;
		var scripts = [];

		/* handle redirect if any */
		if(json.redirect) {
			return (window.location.href = json.redirect);
		}
		
		/* update head */
		for (var i in json.head) {
			jQuery('head').append(json.head[i]);
		}

		/*  update application */
		if(json.application) {
			jQuery('body').html(json.application)
		}

		/*  update dirty widgets */
		var dirtyWidgets = json.widgets;
		for(var i in dirtyWidgets) {
			var script = dirtyWidgets[i].match(script_extractor);
			if(script) {
				for(var j = 0; j < script.length; j++) {
					scripts.push(script[j]);
				}
			}
			updateWidget(i, dirtyWidgets[i].replace(script_extractor, ''));
		}

		/* evaluate scripts */
		//var scripts = json.scripts;
		for(var i in scripts) {
			evalScript(scripts[i]);
		}
	}

	function updateWidget(id, contents) {
		jQuery("."+id).replaceWith(contents);
	}

	function evalScript(script) {
		eval(jQuery(script).html());
	}


	/* ---
	 * Various
	 * -------------------------------------------------------------- */

	function showAjaxLoader(bool) {
		ajaxLoader = bool
	}

	function insertAjaxLoader() {
		jQuery('body').append(
			"<div class='ajax_loader'" +
			"style='position: fixed; _position: absolute;" +
			"top: 10px; right: 10px; z-index: 9999'>" +
			"<img src='/images/ajax_loader.gif'/></div>");
	}

	function showError(error, actionUrl){
		//jQuery("body").html("<h1>Error 500: Internal server error</h1>");
	}

	function removeAjaxLoader() {
		jQuery(".ajax_loader, .ajax_upload").replaceWith("");
	}

	function sizeOf(obj) {
		var size = 0, key;
		for (key in obj) {
			if (obj[key] !== Object.prototype[key]) size++;
			//if (obj.hasOwnProperty(key)) size++;
		}
		return size;
	}

	function startUpload(form){
		var fileInputs = jQuery(form).find('input:file');
		jQuery.each(fileInputs, function(){
			if(jQuery(this).val()) {
				jQuery(this).after(
					'<div class="ajax_upload">loading...<br/>' +
					'<img src="/images/ajax_loader.gif"/></div>');
			}
		})
	}


	/* ---
	 * Public API
	 * -------------------------------------------------------------- */

	return {
		evaluateAnchorAction: evaluateAnchorAction,
		evaluateFormAction: evaluateFormAction,
		evaluateMultipartFormAction: evaluateMultipartFormAction,
		evaluateFormElementAction: evaluateFormElementAction,
		evaluateAction: evaluateAction,
		enableSubmitAction: enableSubmitAction,
		checkHashChange: checkHashChange,
		showAjaxLoader: showAjaxLoader,
		initialize: initialize
	};
})();


jQuery(document).ready(function() {
	iliad.initialize();
	setInterval(iliad.checkHashChange, 200);
});

