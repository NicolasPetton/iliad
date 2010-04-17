"======================================================================
|
|   Iliad.ILCometHandler class definition
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



ILObject subclass: ILCometHandler [
    | session subscriptions semaphores |

    <category: 'Iliad-More-Comet'>
    <comment: nil>

    ILCometHandler class [
	| pingProcess |

	on: aSession [
	    <category: 'instance creation'>
	    ^self new
		session: aSession;
		yourself
	]

	initialize [
	    <category: 'initialization'>
	    Grease.GRPlatform current addToStartUpList: self.
	    Grease.GRPlatform current addToShutDownList: self.
	    self startUp: true.
	]
    
	sessionManager [
	    <category: 'accessing'>
	    ^ILSessionManager current
	]

	startUp: isStarting [
	    <category: 'startup'>
	    isStarting ifTrue: [
		self shutDown: true.
		pingProcess := [[self pingClients] repeat] fork]
	]

	shutDown: isDown [
	    <category: 'startup'>
	    isDown ifTrue: [
		pingProcess ifNotNil: [
		    pingProcess terminate.
		    pingProcess := nil]]
	]

	pingClients [
	    <category: 'private'>
	    (Delay forSeconds: 3 * 60) wait.
	    self sessionManager sessions do: [:each | 
		each cometHandler push]
	]
	
    ]

    initialize [
	<category: 'initialization'>
	super initialize.
	semaphores := OrderedCollection new.
	subscriptions := OrderedCollection new
    ]

    session [
	<category: 'accessing'>
	^session
    ]

    session: aSession [
	<category: 'accessing'>
	session := aSession
    ]

    sessionManager [
	<category: 'accessing'>
	^self class sessionManager
    ]

    otherHandlers [
	<category: 'accessing'>
	^(self sessionManager sessions 
	    copyWithout: self session) collect: [:each |
		each cometHandler]
    ]

    subscribe: aWidget to: anEventClass condition: aBlock [
	<category: 'accessing'>
	subscriptions add: (ILCometSubscription new
	    handler: self;
	    widget: aWidget;
	    eventClass: anEventClass;
	    condition: aBlock)
    ]

    triggerEvent: anEvent [
	<category: 'actions'>
	self otherHandlers do: [:each |
	    each handleEvent: anEvent]
    ]

    handleEvent: anEvent [
	<category: 'actions'>
	(subscriptions 
	    select: [:each | anEvent isKindOf: each eventClass])
	    do: [:each | 
		(each condition value: anEvent) ifTrue: [each push]].
    ]

    waitForEvent [
	<category: 'actions'>
	| s |
	s := Semaphore new.
	semaphores add: s.
	s wait
    ]

    push [
	<category: 'actions'>
	semaphores do: [:each | each signal].
	semaphores := OrderedCollection new
    ]
]

Eval [ILCometHandler initialize]
