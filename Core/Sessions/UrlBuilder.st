"======================================================================
|
|   Iliad.UrlBuilder class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2009 
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
 ======================================================================"


IliadObject subclass: UrlBuilder [
    | actionKey sessionKey tokenKey hashKey |
    
    <comment: nil>
    <category: 'Iliad-Core-Sessions'>

    UrlBuilder class [
	| default |
	
	default [
	    <category: 'instance creation'>
	    ^default ifNil: [default := self new]
	]
    ]

    actionKey [
	<category: 'accessing'>
	^actionKey ifNil: [actionKey := self defaultActionKey]
    ]

    hashKey [
	<category: 'accessing'>
	^hashKey ifNil: [hashKey := self defaultHashKey]
    ]

    sessionKey [
	<category: 'accessing'>
	^sessionKey ifNil: [sessionKey := self defaultSessionKey]
    ]

    tokenKey [
	<category: 'accessing'>
	^tokenKey ifNil: [tokenKey := self defaultTokenKey]
    ]

    addDefaultParametersTo: anUrl [
	<category: 'generating'>
	self shouldUseSessionField ifTrue: [
	    anUrl 
		addParameter: self sessionKey 
		value: self session id asString].
	self shouldUseHashField ifTrue: [
	    anUrl 
		addParameter: self hashKey 
		value: self request hashLocationField]
    ]

    baseUrl [
	<category: 'generating'>
	| url |
	url := Url absolute: self context route pathString.
	self addDefaultParametersTo: url.
	^url
    ]

    urlForAction: anAction [
	<category: 'generating'>
	^self urlForActionKey: anAction key
    ]

    urlForActionKey: aKey [
	<category: 'generating'>
	^self baseUrl
	    addParameter: self actionKey value: aKey;
	    addParameter: self tokenKey value: self session token;
	    yourself
    ]

    urlForRedirection: aString [
	<category: 'generating'>
	| url |
	url := Url absolute: aString.
	self shouldUseSessionField ifTrue: [
	    url addParameter: self sessionKey value: self session id asString].
	^url
    ]

    defaultActionKey [
	<category: 'defaults'>
	^'_action'
    ]

    defaultHashKey [
	<category: 'defaults'>
	^'_hash'
    ]

    defaultSessionKey [
	<category: 'defaults'>
	^'_session'
    ]

    defaultTokenKey [
	<category: 'defaults'>
	^'_token'
    ]

    shouldUseHashField [
	<category: 'testing'>
	^self request hashLocationField notNil
    ]

    shouldUseSessionField [
	<category: 'testing'>
	^(self request cookies 
	    includesKey: self session sessionManager cookieName) not
    ]
]
