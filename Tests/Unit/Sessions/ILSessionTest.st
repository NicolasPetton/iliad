
TestCase subclass: ILSessionTest [
    | session |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    setUp [
	<category: 'running'>
	session := ILSession new
    ]

    testActionRegistries [
	<category: 'tests'>
	| widget1 widget2 actionRegistry1 actionRegistry2 |
	widget1 := ILWidget new.
	widget2 := ILWidget new.
	actionRegistry1 := session addActionRegistryFor: widget1.
	self assert: (session actionRegistryFor: widget1) == actionRegistry1.
	actionRegistry2 := session addActionRegistryFor: widget2.
	self assert: (session actionRegistryFor: widget2) == actionRegistry2.
	self assert: session actionRegistries size = 2.
	session clearActionRegistries.
	self assert: session actionRegistries size = 0
    ]

    testDirtyWidgets [
	<category: 'tests'>
	| widget1 widget2 |
	widget1 := ILWidget new.
	widget2 := ILWidget new.
	session addToDirtyWidgets: widget1.
	self assert: (session dirtyWidgets includes: widget1).
	session addToDirtyWidgets: widget2.
	self assert: (session dirtyWidgets includes: widget2).
	self assert: session dirtyWidgets size = 2.
	session clearDirtyWidgets.
	self assert: session dirtyWidgets size = 0
    ]

    testExpire [
	<category: 'tests'>
	| s |
	s := ILSession new.
	self deny: s isExpired.
	s expire.
	self assert: s isExpired.
	s := ILSession new.
	s expirySeconds: 1.
	self deny: s isExpired.
	(Delay forSeconds: 2) wait.
	self assert: s isExpired
    ]
]

