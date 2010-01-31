"======================================================================
|
|   Iliad.ILJsonHandler class definition
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



ILRequestHandler subclass: ILJsonHandler [
    | jsonContents widgets scripts head widgetsToUpdate |

    <comment: nil>
    <category: 'Iliad-Core-RequestHandlers'>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	jsonContents := Dictionary new.
	head := OrderedCollection new.
	widgets := Dictionary new
    ]

    handleRequest [
	<category: 'request handling'>
	widgetsToUpdate := self session dirtyWidgets copy.
	self session clearDirtyWidgets.
	super handleRequest
    ]

    produceResponse [
	<category: 'responding'>
	self respond: [:response |
	    self shouldRedirect ifTrue: [
		jsonContents 
		    at: 'redirect' 
		    put: self session redirectUrl asString].
	    self shouldUpdateApplication 
		ifFalse: [
		    self updateHead.
		    self updateWidgets]
		ifTrue: [
		    self updateApplication].
	    response nextPutAll: (String streamContents: [:stream |
		jsonContents printJsonOn: stream]).
	    self session clearRedirectUrl.
	    self addNoCacheHeaderTo: response]
    ]

    shouldRedirect [
	<category: 'testing'>
	^self session redirectUrl notNil or: [self session isNew]
    ]

    shouldUpdateApplication [
	<category: 'testing'>
	^self request hashLocationField notNil and: [
	    self request actionField isNil]
    ]

    newResponse [
	<category: 'private'>
	^ILResponse ok
	    contentType: 'application/json'; 
	    yourself
    ]

    updateHead [
	<category: 'private'>
	| headElement |
	headElement := ILElement new.
	widgetsToUpdate do: [:each | each buildHead: headElement].
	headElement childrenDo: [:each |
	    (self application page head children includes: each) ifFalse: [
		head add: each]].
	jsonContents at: 'head' put: head
    ]

    updateWidgets [
	<category: 'private'>
	widgetsToUpdate do: [:each || e |
	    e := each build.
	    widgets at: each id put: e].
	jsonContents at: 'widgets' put: widgets
    ]

    updateApplication [
	<category: 'private'>
	jsonContents 
	    at: 'application' 
	    put: self application build
    ]
]
