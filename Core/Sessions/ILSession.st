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
    | id preferences timestamps expired redirectUrl applications actionRegistries widgets nextId token |

    <category: 'Iliad-Core-Sessions'>
    <comment: 'I represent a session in Iliad. 
    I persist as long as I am active (i.e. an user interacts with an application). 
    When I am inactive, 
    I expire after a timeout set by #expirySeconds.
    I also store actions and applications'> 

    initialize [
	<category: 'initialize-release'>
	super initialize.
	expired := false.
	self setCreatedTimestamp; 
	    setRandomId
    ]

    clearToken [
	<category: 'cleaning'>
	token := nil
    ]

    clearNextId [ 
	<category: 'cleaning'>
	nextId := nil
    ]

    clearWidgets [
	<category: 'cleaning'>
	widgets := nil
    ]

    clearRedirectUrl [
	<category: 'cleaning'>
	redirectUrl := nil
    ]

    clearActionRegistries [
	<category: 'cleaning'>
	actionRegistries := nil
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
	nextId ifNil: [nextId := (Random new next * 100000) asInteger].
	nextId := nextId + 1.
	^nextId printString
    ]

    applications [
	<category: 'accessing'>
	^applications ifNil: [applications := IdentityDictionary new]
    ]

    widgets [
	<category: 'accessing'>
	^widgets ifNil: [widgets := Dictionary new]
    ]

    dirtyWidgets [
	<category: 'accessing'>
	^self widgets 
	    at: #dirty
	    ifAbsentPut: [IdentitySet new]
    ]

    widgetsToAppend [
	<category: 'accessing'>
	^self widgets
	    at: #append
	    ifAbsentPut: [IdentitySet new]
    ]

    widgetsToPrepend [
	<category: 'accessing'>
	^self widgets
	    at: #prepend
	    ifAbsentPut: [IdentitySet new]
    ]

    encoding [
	<category: 'accessing'>
	^self charset
    ]

    route [
	<category: 'accessing'>
	^self context route
    ]

    sessionManager [
	<category: 'accessing'>
	^ILSessionManager current
    ]

    token [
	<category: 'accessing'>
	^token ifNil: [token := ILId new: 8]
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
	^self preferences at: #cookies ifAbsent: [^true]
    ]

    useCookies: aBoolean [
	<category: 'accessing preferences'>
	^self preferenceAt: #cookies put: aBoolean
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

    defaultExpirySeconds [
	<category: 'defaults'>
	^3600
    ]

    defaultLanguage [
	<category: 'defaults'>
	^'en'
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
	    ifNone: [self addActionRegistryFor: aWidget]
    ]
    
    addActionRegistryFor: aWidget [
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

    isNew [
	<category: 'testing'>
	^self createdTimestamp = self modifiedTimestamp
    ]

    shouldUseSessionField [
	<category: 'testing'>
	    ^(self request cookies 
		includesKey: self sessionManager cookieName) not
    ]

    addDirtyWidget: aWidget [
	<category: 'states'>
	self dirtyWidgets add: aWidget
    ]

    addWidgetToAppend: aWidget [
	<category: 'states'>
	self widgetsToAppend add: aWidget
    ]

    addWidgetToPrepend: aWidget [
	<category: 'states'>
	self widgetsToPrepend add: aWidget
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

