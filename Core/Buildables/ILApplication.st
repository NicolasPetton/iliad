"======================================================================
|
|   Iliad.ILApplication class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Some parts of this file reuse code from HttpView2 written by Giovanni 
| Corriga and Göran Krampe http://www.squeaksource.com/HttpView2/ 
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
 ======================================================================"



ILBuildable subclass: ILApplication [
    | model originalRoutePosition page |

    <category: 'Iliad-Core-Buildables'>
    <comment: 'I am the Iliad implementation of an application.

I am is the root object of a buildable object tree. Applications have a
set of controllers, methods used to dispatch requests to the corresponding 
sub-tree of buildable objects (oftenly a composition of stateful widgets).

You don''t have to bother about instantiating applications, the framework 
will handle session and application instances. 

In concrete subclasses, the class method #path should return the base path 
(string) for the application.


""""""""""""""""""""""
" Controller methods "
""""""""""""""""""""""

Like widgets, I am stateful.
Unlike widgets I know how to dispatch a request with #dispatch : 
the controller method corresponding to the url will be called.

Controller methods must:
 - answer a buildable object (a block closure or an instance of ILWidget for example).
 - be in the ''controllers'' method protocol (with the default selector filter)

The default controller method is #index.


""""""""""""""""""
" selectorFilter "
""""""""""""""""""

The class inst var <selectorFilter> is used to filter controller methods. 
By default it allows all methods in the ''controllers'' protocol.

Alternatively, you can override the class method #defaultSelectorFilter to supply 
your own selectorFilter or plug it in using the class method #selectorFilter:'>
    
    ILApplication class [
	| selectorFilter |

	path [
	    "Base path of the application.
	     Override this method in concrete subclasses. 
	     It should return a string"
	    <category: 'accessing'>
	    
	    ^''
	]

	selectorFilter [
	    <category: 'accessing'>
	    ^selectorFilter ifNil: [self defaultSelectorFilter]
	]

	selectorFilter: aBlock [
	    <category: 'accessing'>
	    selectorFilter := aBlock
	]
   
	defaultSelectorFilter [
	    "Override this method to supply your own selectorFilter
	     or plug it in using #selectorFilter:"
	    <category: 'defaults'>
	    
	    ^[:selector | 
		(self canUnderstand: selector) and: [
		    (self 
			categoryOfElement: selector 
			inClassOrSuperclass: self) = 'controllers']]
	]

	categoryOfElement: aSelector inClassOrSuperclass: aClass [
	    "Find the first category of <aSelector> up the superclass chain."
	    <category: 'private'>
	    
	    ^aClass ifNotNil: [
		^(aClass whichCategoryIncludesSelector: aSelector) ifNil: [
		    self 
			categoryOfElement: aSelector 
			inClassOrSuperclass: aClass superclass]]
	]
    ]

    model [
	<category: 'accessing'>
	^model
    ]

    model: anObject [
	<category: 'accessing'>
	model := anObject
    ]

    route [
	<category: 'accessing'>
	^self context route
    ]

    hashRoute [
	<category: 'accessing'>
	^self context hashRoute
    ]

    originalRoutePosition [
	<category: 'accessing'>
	^originalRoutePosition
    ]

    page [
	<category: 'accessing'>
	^page
    ]

    selectorFilter [
	<category: 'accessing'>
	^self class selectorFilter
    ]

    widgetFor: aBuildable [
	"Convenience method. This is useful for building anonymous widgets.
	ex: myWidget := self widgetFor: [:e | e h1: 'Hello world!']"
	<category: 'accessing'>

	^ILPluggableWidget new 
	    contentsBlock: aBuildable; 
	    yourself
    ]

    buildContents [
	"Call #dispatch. A buildable is expected from #dispatch"
	<category: 'building'>
	
	^self newRootElement 
	    build: self dispatch;
	    yourself
    ]

    updatePage: aPage [
	"Override to add elements to aPage.
	 super should always be called"
	<category: 'building'>

	aPage head javascript src: '/javascripts/jquery132min.js'.
	aPage head javascript src: '/javascripts/no_conflict.js'.
	aPage head javascript src: '/javascripts/iliad.js'.
    ]

    allowedSelector: aSelector [
	"Answer true if <aSelector> is ok to call from a URL.
	 Default implementation is to use the pluggable filter block."
	<category: 'dispatching'>

	^self selectorFilter copy value: aSelector
    ]

    dispatch [
	"Dispatch to correct controller method.
	 If dispatchOverride returns something
	 different from nil, consider it handled."
	<category: 'dispatching'>

	self setRoutePosition.
	^self dispatchOverride ifNil: [
	    self dispatchOn: self route next] 
    ]

    dispatchOn: aMethod [
	"Dispatch to correct method:
	 - If <aMethod> is empty we call #index
	 - If the selector is allowed to be executed then we just call it"
	<category: 'dispatching'>
	
	| m |    
	(aMethod isNil or: [aMethod isEmpty])
	    ifTrue: [m := #index]
	    ifFalse: [m := aMethod asSymbol].
	(self allowedSelector: m) 
	    ifTrue: [^self perform: m]
	    ifFalse: [ILDispatchError signal]
    ]

    dispatchOverride [
	"Handle special urls. Subclass implementors
	 should call super first and see if it was handled."
	<category: 'dispatching'>

	^nil
    ]

    redirectTo: anUrlString [
	"Abort all other request handling.
	 Redirect to anUrlString"
	<category: 'redirecting'>

	self session
	    redirectUrl: anUrlString;
	    redirect
    ]

    redirectToIndex [
	"Abort all other request handling.
	 Redirect to the index method of this class"
	<category: 'redirecting'>

	self redirectToLocal: 'index'
    ]

    redirectToLocal: aString [
	"Abort all other request handling.
	 Make a redirection to another controller method in this application"
	<category: 'redirecting'>

	self redirectTo: self originalUrl , '/' , aString
    ]

    redirectToApplication: aClass [
	"Abort all other request handling.
	Redirect to the index method of <aClass>"
	<category: 'redirecting'>

	self redirectToApplication: aClass controller: ''
    ]

    redirectToApplication: aClass controller: aString [
	"Abort all other request handling.
	Redirect to the controller named <aString> of <aClass>"
	<category: 'redirecting'>

	self redirectTo: (self context urlBuilder absolutePathFor: aClass), '/', aString
    ]

    redirectToCurrentController [
	"Abort all other request handling.
	Redirect to the current controller method"
	<category: 'redirecting'>
	self redirectTo: self route pathString
    ]

    respond: aBlock [
	"Abort all other request handling"
	<category: 'redirecting'>

	| response |
	response := ILResponse new.
	aBlock value: response.
	self returnResponse: response
    ]

    returnResponse: aResponse [
	"Abort all other request handling"
	<category: 'redirecting'>
	
	ILResponseNotification new
	    response: aResponse;
	    signal
    ]

    index [
	"default view method"
	<category: 'controllers'>

	^[:e | ]
    ]

    respondOn: aResponse [
	<category: 'converting'>
	page := self defaultPageClass new.
	self updatePage: page.
	page body build: self.
	page respondOn: aResponse
    ]

    defaultPageClass [
	<category: 'defaults'>
	^ILXHTMLPage
    ]

    rootElementClass [
	<category: 'defaults'>
	^ILXHTMLElement
    ]
 
    newRootElement [
	<category: 'private'>
	^self rootElementClass new
    ]

    originalUrl [
	"Answer an url String representing this application's
	 original position within the url of the request."
	<category: 'private'>
	
	| curPos result |
	curPos := self route position.
	self route position: originalRoutePosition.
	result := self route currentPath.
	^result
    ]

    setRoutePosition [
	<category: 'private'>
	originalRoutePosition
	    ifNil: [originalRoutePosition := self route position]
	    ifNotNil: [self route position: originalRoutePosition]
    ]
]
