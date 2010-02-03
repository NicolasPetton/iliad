"======================================================================
|
|   Iliad.ILUrlBuilder class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2010 
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


ILObject subclass: ILUrlBuilder [
    | baseUrl |
    
    <comment: nil>
    <category: 'Iliad-Core-Sessions'>

    ILUrlBuilder class [
	| actionKey tokenKey hashKey sessionKey rewriteRule |

	rewriteRule [
	    "Rewrite rules are used to replace patterns in the baseUrl"
	    <category: 'accessing'>

	    ^rewriteRule
	]

	rewriteRule: anAssociation [
	    <category: 'accessing'>
	    rewriteRule := anAssociation
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
    ]

    actionKey [
	<category: 'accessing'>
	^self class actionKey
    ]

    hashKey [
	<category: 'accessing'>
	^self class hashKey
    ]

    sessionKey [
	<category: 'accessing'>
	^self class sessionKey
    ]

    tokenKey [
	<category: 'accessing'>
	^self class tokenKey
    ]

    rewriteRule [
	<category: 'accessing'>
	^self class rewriteRule
    ]

    addDefaultParametersTo: anUrl [
	<category: 'generating'>
	self shouldUseSessionField ifTrue: [
	    anUrl 
		addParameter: self sessionKey 
		value: self session id asString]
    ]

    baseUrl [
	<category: 'generating'>
	baseUrl ifNil: [| url |
	    url := ILUrl absolute: self context route pathString.
	    self addDefaultParametersTo: url.
	    baseUrl := self applyRewriteRuleTo: url].
	^baseUrl copy
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
	url := ILUrl absolute: aString.
	self shouldUseSessionField ifTrue: [
	    url addParameter: self sessionKey value: self session id asString].
	^url
    ]

    absolutePathFor: anApplicationClass [
	<category: 'generating'>
	| path |
	path := (anApplicationClass path startsWith: '/')
	    ifTrue: [anApplicationClass path]
	    ifFalse: ['/', anApplicationClass path].
	^(self applyRewriteRuleTo: (ILUrl absolute: path)) asString
    ]

    applyRewriteRuleTo: anUrl [
	<category: 'generating'>
	^self rewriteRule 
	    ifNil: [anUrl]
	    ifNotNil: [:assoc | ILUrl absolute: 
		(anUrl asString
		    copyReplacingAllRegex: assoc key 
		    with: assoc value)]
    ]

    shouldUseSessionField [
	<category: 'testing'>
	^(self request cookies 
	    includesKey: self session sessionManager cookieName) not
    ]
]
