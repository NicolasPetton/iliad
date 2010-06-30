"======================================================================
|
|   Iliad.ILDispatcher class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
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



ILObject subclass: ILDispatcher [

    <category: 'Iliad-Core-Dispatching'>
    <comment: 'I am the entry point of requests. 
I dispatch them with the #dispatch: method to an ILApplicationHandler or a 
ILFileHandler.

Web server adapters should use the #dispatch: method on the current instance
of ILDispatcher - returned by ILDispatcher class>>current - to handle requests, 
and wait for a ILResponseNotification to respond to them.'>
    
    ILDispatcher class [
	| current |

	current [
	    <category: 'instance creation'>
	    ^current ifNil: [current := super new]
	]

	new [
	    <category: 'instance creation'>
	    self shouldNotImplement
	]
    ]

    dispatch: aRequest [
	"Entry point of requests"
	<category: 'dispatching'>

	self withErrorHandling: [
	    ILCurrentContext 
		use: (self createContextFor: aRequest)
		during: [self 
		    dispatch: aRequest 
		    using: self context route]]
    ]

    dispatch: aRequest using: aRoute [
	<category: 'dispatching'>
	self withDispatchErrorHandling: [
	    self context application: (self findApplicationFor: aRoute).
	    self context application
		ifNil: [ILFileHandler new handleRequest]
		ifNotNil: [ILApplicationHandler new handleRequest]]
    ]

    withDispatchErrorHandling: aBlock [
	"Catch dispatch errors"
	<category: 'error-handling'>

	aBlock 
	    on: ILDispatchError
	    do: [:error | 
		ILNotFoundHandler new handleRequest]
    ]

    withErrorHandling: aBlock [
	"Catch errors and use an ILErrorHandler to handle them"
	<category: 'error-handling'>
	
	aBlock 
	    on: Error 
	    do: [:error | 
		ILErrorHandler new 
		    error: error; 
		    handleRequest]
    ]

    createContextFor: aRequest [
	<category: 'private'>
	^ILContext new
	    request: aRequest;
	    session: (self findSessionFor: aRequest);
	    yourself
    ]

    applicationClassFor: aRoute [
	<category: 'private'>
	| applicationClass |
	applicationClass := nil.
	[aRoute atEnd not] whileTrue: [
	    aRoute next.
	    applicationClass := ILApplication allSubclasses
		detect: [:each | 
		    (self absolutePathFor: each) = aRoute currentPath]
		ifNone: [applicationClass]].
	 applicationClass ifNotNil: [
	    aRoute position: (ILUrl absolute: applicationClass path) path size].
	    ^applicationClass
    ]
    
    absolutePathFor: anApplicationClass [
	<category: 'private'>
	^(anApplicationClass path startsWith: '/')
	    ifTrue: [anApplicationClass path]
	    ifFalse: ['/', anApplicationClass path]

    ]

    findApplicationFor: aRoute [
	<category: 'private'>
	| applicationClass |
	applicationClass := self applicationClassFor: aRoute.
	applicationClass
	    ifNil: [^nil]
	    ifNotNil: [^ self session applications
		    at: applicationClass
		    ifAbsentPut: [applicationClass new]]
    ]

    findSessionFor: aRequest [
	<category: 'private'>
	^ILSessionManager current sessionFor: aRequest
    ]
]    
