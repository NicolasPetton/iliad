"======================================================================
|
|   Iliad.ILApplicationHandler class definition
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



ILRequestHandler subclass: ILApplicationHandler [
    | actions |
    <comment: nil>
    <category: 'Iliad-Core-RequestHandlers'>

    initialize [
	<category: 'initialization'>
	super initialize.
	actions := OrderedCollection new
    ]

    evaluateActions [
	<category: 'request handling'>
	self getActionsFromRequest.
	(actions asSortedCollection: [:a :b | a key asInteger < b key asInteger]) 
	    do: [:each | each evaluate]
    ]

    handleRequest [
	<category: 'request handling'>
	self session isExpired ifTrue: [self session onExpire].
	self isRequestValid 
	    ifTrue: [self evaluateActions]
	    ifFalse: [ILRedirectHandler new handleRequest].
	self shouldReturnEmptyResponse ifTrue: [
	    self returnResponse: ILResponse ok].
	self shouldRespondInJson ifTrue: [
	    ILJsonHandler new handleRequest].
	self shouldRedirect
	    ifTrue: [ILRedirectHandler new handleRequest]
	    ifFalse: [self produceResponse]
    ]

    produceResponse [
	<category: 'responding'>
	self respond: [:response |
	    self addAllowHeaderTo: response.
	    self session useCookies ifTrue: [self addCookieHeaderTo: response].
	    self session refreshOnBacktrack ifTrue: [self addNoCacheHeaderTo: response]]
    ]

    isRequestValid [
	<category: 'testing'>
	^self context previousStateRegistry notNil
	    or: [self request actionField isNil and: [self request isGet]]
    ]

    shouldRedirect [
	<category: 'testing'>
	^self request isTypeOfRequestForRedirect
    ]

    shouldRespondInJson [
	<category: 'testing'>
	^self request isTypeOfRequestForJson
    ]

    shouldReturnEmptyResponse [
	<category: 'testing'>
	^self request ajaxUploadField notNil
    ]

    newResponse [
	<category: 'private'>
	 ^self application asResponse
    ]

    getActionsFromRequest [
	<category: 'private'>
	| action |
	actions := OrderedCollection new.
	self request isGet ifTrue: [
	    | actionField |
	    actionField := self request actionField.
	    action := self session actionAt: actionField.
	    action ifNotNil: [actions add: action]].
	self request isPost ifTrue: [
	    self request fields associations do: [:asso | 
		(action := self session actionAt: asso value) ifNil: [
		    action := self session actionAt: asso key.
		    action ifNotNil: [action value: asso value]].
		action ifNotNil: [actions add: action]]]
    ]
]
