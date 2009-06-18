TestCase subclass: SessionManagerTest [
    | manager |
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    setUp [
	<category: 'running'>
	manager := SessionManager current
    ]

    tearDown [
	<category: 'running'>
	manager := nil
    ]

    testAddRemove [
	<category: 'testing'>
	| session1 session2 |
	session1 := Session new.
	session2 := Session new.
	manager addSession: session1.
	self deny: (manager sessions includes: session2).
	self assert: (manager sessions includes: session1).
	manager addSession: session2.
	self assert: (manager sessions includes: session2).
	manager removeSession: session1.
	self deny: (manager sessions includes: session1).
	manager removeSession: session2.
	self deny: (manager sessions includes: session2).
	session1 := session2 := nil
    ]

    testExpiredSession [
	<category: 'testing'>
	| session |
	session := Session new
	    expirySeconds: -1;
	    yourself.
	manager addSession: session.
	self assert: (manager sessions includes: session).
	self assert: session isExpired.
	manager removeExpiredSessions.
	self deny: (manager sessions includes: session)
    ]

    testFindSession [
	<category: 'testing'>
	| session1 session2 |
	session1 := Session new.
	session2 := Session new.
	manager addSession: session1.
	manager addSession: session2.
	self assert: (manager findSessionWithId: session2 id asString) = session2.
	self assert: (manager findSessionWithId: session1 id asString) = session1.
	manager
	    removeSession: session2;
	    removeSession: session1.
	self deny: (manager findSessionWithId: session1 id asString) = session1.
	self deny: (manager findSessionWithId: session2 id asString) = session2.
	session1 := session2 := nil
    ]
]

