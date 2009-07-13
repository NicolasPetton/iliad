"======================================================================
|
|   Iliad.Application class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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



Widget subclass: Application [
    | model originalRoutePosition |

    <category: 'Iliad-Core-Buildables'>
    <comment: 'I am the implementation of an application.
 
The first thing to do to develop web applications with Iliad is to subclass me.
You don''t have to bother about instantiating applications, the framework 
will handle session and application instances. 
In concrete subclasses, the class method #path should return the base path 
(string) for the application.

Like other widgets, I have state, and can have decorators.
Unlike other widgets I know how to dispatch a request with #dispatch : 
the view method corresponding to the url will be called.

View methods must:
 - answer a view block, ie, a block closure taking an element as parameter.
 - be in the ''views'' method protocol (with the default selector filter)

The default view method is #index.

The class inst var <selectorFilter> is used to filter view methods. 
By default it allows all methods in the ''views'' protocol,
but you can override the class method #defaultSelectorFilter to supply 
your own selectorFilter or plug it in using the class method #selectorFilter:

Applications can be in one the following modes: deployment, verbose or 
debug. The default mode is verbose.
You can switch between modes with class methods in the <accessing-modes> 
protocol.

When errors occur, the framework with handle them differently depending on 
the application mode:
- in deployment mode, it will respond an error 500;
- in verbose mode, it will also respond an error 500, but with error details;
- in debug mode, a debugger window will open on the error;'>
    
    Application class [
	| selectorFilter mode |

	path [
	    "Override this method in concrete subclasses. 
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
    
	mode [
	    <category: 'accessing'>
	    ^mode ifNil: [mode := #verbose]
	]
    
	mode: aSymbol [
	    <category: 'accessing'>
	    mode := aSymbol
	] 
    
	verboseMode [
	    <category: 'accessing-modes'>
	    self mode: #verbose
	]
    
	debugMode [
	    <category: 'accessing-modes'>
	    self mode: #debug
	]

	deploymentMode [
	    <category: 'accessing-modes'>
	    self mode: #deployment
	]

	defaultSelectorFilter [
	    "Override this method to supply your own selectorFilter
	     or plug it in using #selectorFilter:"
	    <category: 'defaults'>
	    
	    ^[:selector | 
		(self canUnderstand: selector) and: [
		    (self 
			categoryOfElement: selector 
			inClassOrSuperclass: self) = 'views']]
	]

	categoryOfElement: aSelector inClassOrSuperclass: aClass [
	    "Find first category of <aSelector> up the superclass chain."
	    <category: 'private'>
	    
	    ^aClass ifNotNil: [
		^(aClass whichCategoryIncludesSelector: aSelector) ifNil: [
		    self 
			categoryOfElement: aSelector 
			inClassOrSuperclass: aClass superclass]]
	]

	isDebugMode [
	    <category: 'testing'>
	    ^self mode = #debug
	]
    
	isVerboseMode [
	    <category: 'testing'>
	    ^self mode = #verbose
	]

	isDeploymentMode [
	    <category: 'testing'>
	    ^self isDebugMode not and: [
		self isVerboseMode not]
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

    selectorFilter [
	<category: 'accessing'>
	^self class selectorFilter
    ]

    contents [
	"Call #dispatch. A view block is expected from #dispatch"
	<category: 'building'>
	
	^[:e |
	     e build: self dispatch]
    ]

    updatePage: aPage [
	"Override to add elements to aPage.
	 super should always be called"
	<category: 'building'>

	aPage head javascript source: '/javascripts/jquery132min.js'.
	aPage head javascript source: '/javascripts/no_conflict.js'.
	aPage head javascript source: '/javascripts/iliad.js'.
    ]

    allowedSelector: aSelector [
	"Answer true if <aSelector> is ok to call from a URL.
	 Default implementation is to use the pluggable filter block."
	<category: 'dispatching'>

	^self selectorFilter copy value: aSelector
    ]

    dispatch [
	"Dispatch to correct method in this view.
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
	    ifFalse: [DispatchError signal]
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
	 Redirect to the index view of this class"
	<category: 'redirecting'>

	self redirectToLocal: 'index'
    ]

    redirectToLocal: aView [
	"Abort all other request handling.
	 Make a redirection to another view method in this application"
	<category: 'redirecting'>
	self redirectTo: self originalUrl , '/' , aView
    ]

    index [
	"default view method"
	<category: 'views'>

	^[:e | ]
    ]

    respondOn: aResponse [
	<category: 'converting'>
	| page |
	page := self defaultPageClass new.
	self buildOn: page body.
	self updatePage: page.
	page respondOn: aResponse
    ]

    defaultPageClass [
	<category: 'defaults'>
	^XHTMLPage
    ]

    isDebugMode [
	<category: 'testing'>
	^self class isDebugMode
    ]

    isVerboseMode [
	<category: 'testing'>
	^self class isVerboseMode
    ]

    isDeploymentMode [
	<category: 'testing'>
	^self class isDeploymentMode
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
