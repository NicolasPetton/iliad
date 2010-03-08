"======================================================================
|
|   Iliad.ILSession class definition
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



ILObject subclass: ILSession [
    | id preferences others timestamps expired redirectUrl applications actionRegistries stateRegistries nextId |

    <category: 'Iliad-Core-Sessions'>
    <comment: 'I represent a session in Iliad. 
    I persist as long as I am active (i.e. an user interacts with an application). 
    When I am inactive, 
    I expire after a timeout set by #expirySeconds.
    I also store actions and applications'> 

    initialize [
	<category: 'initialization'>
	super initialize.
	expired := false.
	self setCreatedTimestamp; 
	    setRandomId
    ]

    clearRedirectUrl [
	<category: 'cleaning'>
	redirectUrl := nil
    ]

    clearActionRegistries [
	<category: 'cleaning'>
	actionRegistries := nil
    ]

    clearStateRegistries [
	<category: 'cleaning'>
	stateRegistries := nil
    ]

    id [
	<category: 'accessing'>
	^id
    ]

    id: anObject [
	<category: 'accessing'>
	id := anObject
    ]

    nextId [
	<category: 'accessing'>
	nextId ifNil: [nextId := Grease.GRPlatform current newRandom nextInt: 100000].
	nextId := nextId + 1.
	^nextId greaseString
    ]

    applications [
	<category: 'accessing'>
	^applications ifNil: [applications := IdentityDictionary new]
    ]

    dirtyWidgets [
	<category: 'accessing'>
	^self previousStateRegistry 
	    ifNil: [#()]
	    ifNotNil: [self previousStateRegistry dirtyWidgets]
    ]

    encoding [
	<category: 'accessing'>
	^self charset
    ]

    route [
	<category: 'accessing'>
	^self context route
    ]

    stateRegistry [
	<category: 'accessing'>
	^self context stateRegistry
    ]

    previousStateRegistry [
	<category: 'accessing'>
	^self context previousStateRegistry
    ]

    sessionManager [
	<category: 'accessing'>
	^ILSessionManager current
    ]

    charset [
	<category: 'accessing preferences'>
	^self preferenceAt: #charset ifAbsentPut: ['utf-8']
    ]

    charset: aString [
	<category: 'accessing preferences'>
	^self preferenceAt: #charset put: aString
    ]

    expirySeconds [
	<category: 'accessing preferences'>
	^self preferenceAt: #expirySeconds ifAbsentPut: [self defaultExpirySeconds]
    ]

    expirySeconds: anInteger [
	<category: 'accessing preferences'>
	^self preferenceAt: #expirySeconds put: anInteger
    ]

    language [
	<category: 'accessing preferences'>
	^self preferenceAt: #language ifAbsentPut: [self defaultLanguage]
    ]

    language: aSymbol [
	<category: 'accessing preferences'>
	^self preferences at: #language put: aSymbol
    ]

    refreshOnBacktrack [
	<category: 'accessing preferences'>
	^self preferenceAt: #refreshOnBacktrack ifAbsentPut: [true]
    ]

    refreshOnBacktrack: aBoolean [
	<category: 'accessing preferences'>
	^self preferenceAt: #refreshOnBacktrack put: aBoolean
    ]

    useCookies [
	<category: 'accessing preferences'>
	^self preferenceAt: #cookies ifAbsentPut: [^true]
    ]

    useCookies: aBoolean [
	<category: 'accessing preferences'>
	^self preferenceAt: #cookies put: aBoolean
    ]

    preferenceAt: aSymbol [
	<category: 'accessing preferences'>
	^self preferences at: aSymbol ifAbsent: [nil]
    ]

    preferenceAt: aSymbol ifAbsentPut: aBlock [
	<category: 'accessing preferences'>
	^self preferences at: aSymbol ifAbsentPut: aBlock
    ]

    preferenceAt: aSymbol put: anObject [
	<category: 'accessing preferences'>
	^self preferences at: aSymbol put: anObject
    ]

    preferences [
	<category: 'accessing preferences'>
	^preferences ifNil: [preferences := Dictionary new]
    ]

    createdTimestamp [
	<category: 'accessing timestamps'>
	^self timestamps at: #created ifAbsent: [self setCreatedTimestamp]
    ]

    modifiedTimestamp [
	<category: 'accessing timestamps'>
	^self timestamps at: #modified ifAbsent: [self createdTimestamp]
    ]

    setCreatedTimestamp [
	<category: 'accessing timestamps'>
	self timestampAt: #created put: DateTime now
    ]

    setModifiedTimestamp [
	<category: 'accessing timestamps'>
	self timestampAt: #modified put: DateTime now
    ]

    timestampAt: aSymbol [
	<category: 'accessing timestamps'>
	^self timestamps at: aSymbol ifAbsent: [nil]
    ]

    timestampAt: aSymbol ifAbsentPut: aBlock [
	<category: 'accessing timestamps'>
	^self timestamps at: aSymbol ifAbsentPut: aBlock
    ]

    timestampAt: aSymbol put: anObject [
	<category: 'accessing timestamps'>
	^self timestamps at: aSymbol put: anObject
    ]

    timestamps [
	<category: 'accessing timestamps'>
	^timestamps ifNil: [timestamps := Dictionary new]
    ]

    others [
	<category: 'accessing others'>
	^others ifNil: [others := Dictionary new]
    ]

    otherAt: aKey [
	<category: 'accessing others'>
	^self others at: aKey ifAbsent: [nil]
    ]

    otherAt: aKey put: anObject [
	<category: 'accessing others'>
	self others at: aKey put: anObject
    ]

    otherAt: aKey ifAbsentPut: aBlock [
	<category: 'accessing others'>
	^self others at: aKey ifAbsentPut: aBlock
    ]

    defaultExpirySeconds [
	<category: 'defaults'>
	^1800
    ]

    defaultLanguage [
	<category: 'defaults'>
	^'en'
    ]

    stateRegistries [
	<category: 'states'>
	^stateRegistries ifNil: [stateRegistries := OrderedCollection new]
    ]

    stateRegistryAt: aString [
	<category: 'states'>
	^self stateRegistries 
	    detect: [:each | each key = aString]
	    ifNone: [nil]
    ]

    newStateRegistry [
	<category: 'states'>
	| registry |
	registry := self stateRegistries isEmpty
	    ifTrue: [ILStateRegistry new]
	    ifFalse: [ILStateRegistry fromRegistry: self stateRegistries last].
	self stateRegistries add: registry.
	^registry
    ]

    actionRegistries [
	<category: 'actions'>
	^actionRegistries ifNil: [
	    actionRegistries := OrderedCollection new]
    ]

    actionRegistryFor: aWidget [
	<category: 'actions'>
	^self actionRegistries 
	    detect: [:each | each owner = aWidget]
	    ifNone: [self newActionRegistryFor: aWidget]
    ]
    
    newActionRegistryFor: aWidget [
	<category: 'actions'>
	^self actionRegistries add: (ILActionRegistry owner: aWidget)
    ]

    actionAt: aKeyString [
	<category: 'actions'>
	| action |
	self actionRegistries do: [:each |
	    action := each actionAt: aKeyString.
	    action ifNotNil: [^action]].
	^nil
    ]

    registerActionFor: aBlock [
	<category: 'actions'>
	| action |
	action := ILAction new
	    key: self nextId;
	    block: aBlock;
	    yourself.
	self registerAction: action.
	^action
    ]

    registerAction: anAction [
	<category: 'actions'>
	ILCurrentActionRegistry value register: anAction
    ]

    evaluateActionKey: aString [
	<category: 'actions'>
	self actionRegistries do: [:each |
	    each evaluateActionKey: aString]
    ]

    redirect [
	<category: 'redirection'>
	ILRedirectHandler new
	    produceResponse
    ]
    
    redirectTo: anUrlString [
	<category: 'redirection'>
	self context application redirectTo: anUrlString
    ]
  
    redirectToLocal: anUrlString [
	<category: 'redirection'>
	self context application redirectToLocal: anUrlString
    ]
 
    redirectUrl [
	<category: 'redirection'>
	^redirectUrl
    ]

    redirectUrl: aString [
	<category: 'redirection'>
	redirectUrl := self context urlBuilder urlForRedirection: aString
    ]

    redirectToIndex [
	<category: 'redirection'>
	self context application redirectToIndex
    ]

    isExpired [
	<category: 'testing'>
	(DateTime now asSeconds - self modifiedTimestamp asSeconds
	    > self expirySeconds) ifTrue: [
		self expire].
	^expired
    ]

    shouldUseSessionField [
	<category: 'testing'>
	    ^(self request cookies 
		includesKey: self sessionManager cookieName) not
    ]

    expire [
	<category: 'private'>
	self actionRegistries do: [:each | 
	    each unregisterAllActions].
	expired := true
    ]

    setRandomId [
	<category: 'private'>
	^self id: ILId new
    ]
]
