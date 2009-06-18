"======================================================================
|
|   Iliad.Dispatcher class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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



IliadObject subclass: Dispatcher [

    <category: 'Iliad-Core-Dispatching'>
    <comment: 'I am the entry point of requests. 
I dispatch them with the #dispatch: method to an ApplicationHandler or a 
FileHandler.

Web server adapters should use the #dispatch: method on the current instance
of Dispatcher - returned by Dispatcher class>>current - to handle requests, 
and wait for a ResponseNotification to respond to them.'>
    
    Dispatcher class [
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
	    CurrentContext 
		use: (self createContextFor: aRequest)
		during: [self 
		    dispatch: aRequest 
		    using: self context route]]
    ]

    dispatch: aRequest using: aRoute [
	<category: 'dispatching'>
	self withDispatchErrorHandling: [
	    self shouldDoInitialRedirect ifTrue: [
		RedirectHandler new handleRequest].
	    self context application: (self findApplicationFor: aRoute).
	    self context application
		ifNil: [FileHandler new handleRequest]
		ifNotNil: [ApplicationHandler new handleRequest]]
    ]

    withDispatchErrorHandling: aBlock [
	"Catch dispatch errors"
	<category: 'error-handling'>

	aBlock 
	    on: DispatchError
	    do: [:error | 
		NotFoundHandler new handleRequest]
    ]

    withErrorHandling: aBlock [
	"Catch errors and use an ErrorHandler to handle them"
	<category: 'error-handling'>
	
	aBlock 
	    on: Error 
	    do: [:error | 
		ErrorHandler new 
		    error: error; 
		    handleRequest]
    ]

    shouldDoInitialRedirect [
	<category: 'testing'>
	^(self request sessionField isNil and: [
	    self request hasCookies not]) or: [
		self request sessionField notNil and: [self request hasCookies]]
    ]

    absolutePathFor: anApplicationClass [
	<category: 'private'>
	(anApplicationClass path startsWith: '/')
	ifTrue: [^anApplicationClass path]
	ifFalse: [^'/', anApplicationClass path]
    ]

    applicationClassFor: aRoute [
	<category: 'private'>
	| applicationClass |
	applicationClass := nil.
	[applicationClass isNil and: [aRoute atEnd not]] whileTrue: [
	    aRoute next.
	    applicationClass := Application allSubclasses
		detect: [:each | 
		    (self absolutePathFor: each) = aRoute currentPath]
		ifNone: [nil]].
	^ applicationClass
    ]
    
    createContextFor: aRequest [
	<category: 'private'>
	^Context new
	    request: aRequest;
	    session: (self findSessionFor: aRequest);
	    yourself
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
	^SessionManager current findOrMakeSessionFor: aRequest
    ]
]    
