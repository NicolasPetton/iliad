"======================================================================
|
|   Iliad.ILRouter class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
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



ILObject subclass: ILRouter [
    | route hashRoute application controller |

    <category: 'Iliad-Core-Dispatching'>
    <comment: nil>

    initialize [
	<category: 'initialization'>
	super initialize.
	self 
	    setApplication;
	    setRoutePosition;
	    setController;
	    updateApplicationFromRoute
    ]

    dispatchRequest [
	<category: 'dispatching'>
	self shouldRedirect ifTrue: [
	    ILRedirectHandler new handleRequest].
	self application
	    ifNil: [ILFileHandler new handleRequest]
	    ifNotNil: [ILApplicationHandler new handleRequest]
    ]

    route [
	<category: 'accessing'>
	^route ifNil: [route := ILRoute path: self request url path]
    ]

    hashRoute [
	<category: 'accessing'>
	| hash |
	hash := self request hashLocationField ifNil: [''].
	^hashRoute ifNil: [hashRoute := ILRoute path: (hash tokenize: '/')]
    ]

    application [
	<category: 'accessing'>
	^application
    ]

    controller [
	<category: 'accessing'>
	^controller
    ]

    shouldRedirect [
	<category: 'testing'>
	self request isTypeOfRequestForJson ifTrue: [^false].
	^self request sessionField notNil and: [self request hasCookies]
    ]

    setApplication [
	<category: 'private'>
	application := self applicationClass
	    ifNotNil: [:applicationClass |
		self session applications
		    at: applicationClass
		    ifAbsentPut: [applicationClass new]]
    ]
    
    setRoutePosition [
	<category: 'private'>
	 self application ifNotNil: [
	    self route position: 
		(ILUrl absolute: self application class path) path size]
    ]

    setController [
	<category: 'private'>
	self route atEnd ifFalse: [
	    controller := self route next]
    ]

    applicationClass [
	<category: 'private'>
	| applicationClass |
	applicationClass := nil.
	[self route atEnd not] whileTrue: [
	    self route next.
	    applicationClass := ILApplication allSubclasses
		detect: [:each | each absolutePath = self route currentPath]
		ifNone: [applicationClass]].
	^applicationClass
    ]
    
    updateApplicationFromRoute [
	<category: 'updating'>
	self application ifNotNil: [
	    self application updateFromRoute: self route]
    ]
]
