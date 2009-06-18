"======================================================================
|
|   Iliad.SessionManager class definition
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




IliadObject subclass: SessionManager [
    | sessions preferences |
    <category: 'Iliad-Core-Sessions'>
    <comment: 'I am responsible for managing, creating and removing sessions.
The class method #current answers my only instance.

You shouldn''t subclass me. 
Instead, you can change my preferences with methods in the 
<accessing preferences> protocol.

In addition, do not try to access the current session from here, 
use ILContext>>session instead.

-- maintenance --

To remove all sessions, even not expired ones, call #removeAllSessions.
To remove all expired sessions, call #removeExpiredSessions'>
    
    SessionManager class [
	| current |
    ]

    SessionManager class >> current [
	<category: 'instance creation'>
	^current ifNil: [current := super new]
    ]

    SessionManager class >> new [
	<category: 'instance creation'>
	self shouldNotImplement
    ]

    sessions [
	<category: 'accessing'>
	^sessions ifNil: [sessions := Dictionary new]
    ]

    expiredSessions [
	<category: 'accessing'>
	^self sessions values select: [:each | each isExpired]
    ]

    sessionKey [
	"session key in requests"
	<category: 'accessing preferences'>

	^self preferenceAt: #sessionKey ifAbsentPut: ['_session']
    ]

    actionKey [
	<category: 'accessing preferences'>
	^self preferenceAt: #actionKey ifAbsentPut: ['_action']
    ]

    cookieName [
	<category: 'accessing preferences'>
	^self preferenceAt: #cookieName ifAbsentPut: ['_iliad685744']
    ]

    cookieName: aString [
	<category: 'accessing preferences'>
	^self preferenceAt: #cookieName put: aString
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

    sessionClass [
	<category: 'accessing preferences'>
	^self preferenceAt: #sessionClass ifAbsentPut: [Session]
    ]

    sessionClass: aSessionClass [
	<category: 'accessing preferences'>
	^self preferences at: #sessionClass put: aSessionClass
    ]

    tokenKey [
	<category: 'accessing preferences'>
	^self preferenceAt: #tokenKey ifAbsentPut: ['_token']
    ]

    addSession: aSession [
	<category: 'adding-removing'>
	self sessions at: aSession id asString put: aSession
    ]

    findOrMakeSessionFor: aRequest [
	"Answer the according session for <aRequest>.
	the session id may be found from <aRequest> cookies or <aRequest> fields.
	If no session is found, create and return a new one"
	<category: 'adding-removing'>

	
	self shouldRemoveExpiredSessions ifTrue: [
		self removeExpiredSessions].
	^self findSessionWithId: (self sessionIdFromRequest: aRequest)
    ]

    removeSession: aSession [
	<category: 'adding-removing'>
	aSession removeYourself
    ]

    shouldRemoveExpiredSessions [
	"Do not remove all expired sessions for each request,
	so only answer true if sessions size modulo 10 equals 0"
	<category: 'testing'>

	^(self sessions size \\ 10) = 0
    ]

    findSessionWithId: anId [
	"find and answer  a not expired session with id <anId>.
	Create a new session is no session found"
	<category: 'private'>

	| session |
	session := self sessions at: anId ifAbsent: [^self newSession].
	session isExpired
	    ifFalse: [
		session setModifiedTimestamp.
		^session]
	    ifTrue: [
		self removeSession: session.
		^self newSession]
    ]

    newSession [
	<category: 'private'>
	| session |
	session := self sessionClass new.
	self addSession: session.
	^session
    ]

    removeAllSessions [
	"Remove all sessions. Use for maintenance"
	<category: 'private'>

	self sessions values do: [:each | self removeSession: each].
	sessions := Dictionary new
    ]

    removeExpiredSessions [
	"Remove all expired sessions"
	<category: 'private'>

	self expiredSessions do: [:each |
	    self removeSession: each]
    ]

    sessionIdFromCookies: cookies [
	<category: 'private'>
	cookies ifNil: [^nil].
	^cookies at: self cookieName ifAbsent: [nil]
    ]
     
    sessionIdFromRequest: aRequest [
	<category: 'private'>
	^aRequest sessionField ifNil: [
	    self sessionIdFromCookies: aRequest cookies]
    ]
]
