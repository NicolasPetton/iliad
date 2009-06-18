"======================================================================
|
|   Iliad.JsonHandler class definition
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



RequestHandler subclass: JsonHandler [
    | jsonContents |

    <comment: nil>
    <category: 'Iliad-Core-RequestHandlers'>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	jsonContents := Dictionary new
    ]

    produceResponse [
	<category: 'responding'>
	self respond: [:response || widgets scripts |
	    self shouldRedirect ifTrue: [
		jsonContents 
		    at: 'redirect' 
		    put: self session redirectUrl asString].
		widgets := Dictionary new.
		scripts := OrderedCollection new.
	    self session dirtyWidgets do: [:each || e |
		e := each build.
		widgets at: each id put: e.
		e withAllChildrenDo: [:child |
		    child tag = 'script' ifTrue: [
			scripts add: child]]].
	    jsonContents at: 'widgets' put: widgets.
	    jsonContents at: 'scripts' put: scripts.
	    response nextPutAll: (String streamContents: [:stream |
		jsonContents printJsonOn: stream]).
	    self session
		clearDirtyWidgets;
		clearRedirectUrl]
    ]

    shouldRedirect [
	<category: 'testing'>
	^self session redirectUrl notNil
    ]

    newResponse [
	<category: 'private'>
	^Response ok
	    contentType: 'application/json'; 
	    yourself
    ]
]
