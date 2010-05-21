
TestCase subclass: ILSessionManagerTest [
    | manager |
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    setUp [
	<category: 'running'>
	manager := ILSessionManager current
    ]

    tearDown [
	<category: 'running'>
	manager := nil
    ]

    testAddRemove [
	<category: 'testing'>
	| session1 session2 |
	session1 := ILSession new.
	session2 := ILSession new.
	manager addSession: session1.
	self deny: (manager hasSession: session2).
	self assert: (manager hasSession: session1).
	manager addSession: session2.
	self assert: (manager hasSession: session2).
	manager removeSession: session1.
	self deny: (manager hasSession: session1).
	manager removeSession: session2.
	self deny: (manager hasSession: session2).
	session1 := session2 := nil
    ]

    testExpiredSession [
	<category: 'testing'>
	| session |
	session := ILSession new
	    expirySeconds: -1;
	    yourself.
	manager addSession: session.
	self assert: (manager hasSession: session).
	self assert: session isExpired.
	manager removeExpiredSessions.
	self deny: (manager hasSession: session)
    ]

    testFindSession [
	<category: 'testing'>
	| session1 session2 request1 request2 |
	session1 := ILSession new.
	request1 := ILRequest new
	    fields: (Dictionary new
		at: '_session' put: session1 id;
		yourself);
	    yourself.
	session2 := ILSession new.
	request2 := ILRequest new
	    fields: (Dictionary new
		at: '_session' put: session2 id;
		yourself);
	    yourself.
	manager addSession: session1.
	manager addSession: session2.
	self assert: (manager findOrMakeSessionFor: request1) = session1.
	self assert: (manager findOrMakeSessionFor: request2) = session2.
	manager
	    removeSession: session2;
	    removeSession: session1.
	self deny: (manager findOrMakeSessionFor: request1) = session1.
	self deny: (manager findOrMakeSessionFor: request2) = session2.
	session1 := session2 := nil
    ]

    testPreferences [
	<category: 'testing'>
	| obj |
	obj := 'bar'.
	manager preferenceAt: #foo put: obj.
	self assert: (manager preferenceAt: #foo) = obj
    ]
]

