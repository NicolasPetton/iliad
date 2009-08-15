var Iliad = {

    /* Public */

	hash: "",

    evaluateAnchorAction: function(anchor, hashString) {
        var actionUrl = jQuery(anchor).attr('href');
		if(hashString) {this._setHashLocation(hashString)};
        this.evaluateAction(actionUrl);
    },

    evaluateFormAction: function(form) {
        var actionUrl = this._getFormActionUrl(form);
        var data = jQuery(form).serialize();
        this.evaluateAction(actionUrl, "post", data);
    },

	evaluateFormElementAction: function(formElement) {
		this.evaluateFormAction(jQuery(formElement).closest("form"));
	},
    
    enableSubmitAction: function(button) {
        var name = jQuery(button).attr("name");
        if(name) {
            var hidden = "<input type='hidden' name='" + name + "'></input>";
            var form = jQuery(button).closest("form");
            jQuery(form).append(hidden);
        }
    },

    evaluateAction: function(actionUrl, method, data) {
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
                that._insertAjaxLoader()},
            success: function(json) {
                that._processUpdates(json);
                that._removeAjaxLoader();
            },
            error: function(err) {
                that._showError(actionUrl);
            }
        });
    },
   
	checkHashChange: function() {
		var newHash = this._getHashLocation();
		if(this.hash != newHash) {
			this.hash = newHash;
			var that = this;
			jQuery.ajax({
				url: window.location.pathname + '?_hash=' + this.hash,
				dataType: "html",
            	beforeSend: function(xhr) {
                	xhr.setRequestHeader("X-Requested-With", ""); 
                	that._insertAjaxLoader();
				},
            	success: function(response) {
					var extractor = /<body[^>]*>((.|\s)*)<\/body>/;
                	jQuery("body").html(extractor.exec(response)[1]);
                	that._removeAjaxLoader();
            	}
			});
		}
	},

    /* Private */

    _hasActionUrl: function(anchor) {
        if(anchor && jQuery(anchor).attr('href')) {
            return /_action?=(.*)$/.test(jQuery(anchor).attr('href'));
        }
    },
    
	_setHashLocation: function(hashString) {
		this.hash = hashString;
		window.location.hash = this.hash;
	},

	_getHashLocation: function() {
		return window.location.hash.substr(1);
	},

    _getFormActionUrl: function(form) {
        return jQuery(form).attr('action')
    },

    _processUpdates: function(json) {
        /* handle redirect if any */
        if(json.redirect) {
            return window.location.href = json.redirect
        }
        
        /* Refresh if there is no widget to update 
           (session expired or the action is invalid) */
        if(this.sizeOf(json.widgets) == 0) {
            return window.location.reload()
        } 
    
        /* else update dirty widgets */
        var dirtyWidgets = json.widgets;
        for(var i in dirtyWidgets) {
            this._updateWidget(i, dirtyWidgets[i]);
        }

        /* evaluate scripts */
        var scripts = json.scripts;
        for(var i in scripts) {
            this._evalScript(scripts[i]);
        }
    },
    
    _updateWidget: function(id, contents) {
        jQuery("#"+id).replaceWith(contents)
    },

    _evalScript: function(script) {
        try {eval(jQuery(script).html())}
        catch(e){}
    },

    _insertAjaxLoader: function() {
        jQuery('body').append('<div class="ajax_loader" style="position: fixed; top: 10px; right: 10px; z-index: 9999"><img src="/images/ajax_loader.gif"/></div>')
    },

    _showError: function(actionUrl){
        jQuery("body").html("<h1>Error 500: Internal server error</h1>")
    },

    _removeAjaxLoader: function() {
        jQuery(".ajax_loader").replaceWith("");
    },
    
    sizeOf: function(obj) {
        var size = 0, key;
        for (key in obj) {
            if (obj.hasOwnProperty(key)) size++;
        }
        return size;
    }
};


jQuery(document).ready(function() {
	setInterval("Iliad.checkHashChange()", 200);
});


