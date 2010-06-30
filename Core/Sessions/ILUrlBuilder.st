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
	| actionKey hashKey sessionKey ajaxUploadKey stateKey rewriteRules |

	rewriteRules [
	    "Rewrite rules are used to replace patterns in the baseUrl"
	    <category: 'accessing'>

	    ^rewriteRules ifNil: [rewriteRules := OrderedCollection new]
	]

	addRewriteRule: aBlock [
	    <category: 'accessing'>
	    self rewriteRules add: aBlock
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

	ajaxUploadKey [
	    <category: 'accessing'>
	    ^ajaxUploadKey ifNil: [ajaxUploadKey := self defaultAjaxUploadKey]
	]

	stateKey [
	    <category: 'accessing'>
	    ^stateKey ifNil: [stateKey := self defaultStateKey]
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

	defaultAjaxUploadKey [
	    <category: 'defaults'>
	    ^'_ajax_upload'
	]

	defaultStateKey [
	    <category: 'defaults'>
	    ^'_state'
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

    stateKey [
	<category: 'accessing'>
	^self class stateKey
    ]

    rewriteRules [
	<category: 'accessing'>
	^self class rewriteRules
    ]

    addDefaultParametersTo: anUrl [
	<category: 'generating'>
	self shouldUseSessionField ifTrue: [
	    anUrl 
		addParameter: self sessionKey 
		value: self session id greaseString]
    ]

    baseUrl [
	<category: 'generating'>
	baseUrl ifNil: [| url |
	    url := ILUrl absolute: self context route pathString.
	    self addDefaultParametersTo: url.
	    baseUrl := self applyRewriteRulesTo: url].
	^baseUrl copy
    ]

    urlFor: aString [
	<category: 'generating'>
	^self applyRewriteRulesTo: (ILUrl absolute: aString)
    ]

    urlForAction: anAction [
	<category: 'generating'>
	^self urlForAction: anAction hash: ''
    ]

    urlForAction: anAction hash: aHashString [
	<category: 'generating'>
	^self urlForActionKey: anAction key hash: aHashString
    ]

    urlForActionKey: aKeyString hash: aHashString [
	<category: 'generating'>
	| url |
	url := self baseUrl.
	url
	    addParameter: self actionKey value: aKeyString;
	    addParameter: self stateKey value: self session stateRegistry key.
	aHashString notEmpty ifTrue: [
	    url addParameter: self hashKey value: aHashString].
	^url
    ]

    urlForRedirection: aString [
	<category: 'generating'>
	| url |
	url := ILUrl absolute: aString.
	self shouldUseSessionField ifTrue: [
	    url addParameter: self sessionKey value: self session id greaseString].
	^url
    ]

    absolutePathFor: anApplicationClass [
	<category: 'generating'>
	^(self applyRewriteRulesTo: 
	    (self urlForRedirection: anApplicationClass path)) greaseString
    ]

    applyRewriteRulesTo: anUrl [
	<category: 'generating'>
	| tempUrl |
	tempUrl := anUrl.
	self rewriteRules do: [:each |
	    tempUrl := ILUrl absolute: (each value: tempUrl greaseString)].
	^tempUrl
    ]

    shouldUseSessionField [
	<category: 'testing'>
	^(self request cookies 
	    includesKey: self session sessionManager cookieName) not
    ]
]
