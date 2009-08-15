TestCase subclass: SessionTest [
    | session |

    <comment: nil>
    <category: 'Iliad-Core-Tests-Sessions'>

    setUp [
	<category: 'running'>
	session := Session new
    ]

    testActionRegistries [
	<category: 'tests'>
	| widget1 widget2 actionRegistry1 actionRegistry2 |
	widget1 := Widget new.
	widget2 := Widget new.
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
	widget1 := Widget new.
	widget2 := Widget new.
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
	s := Session new.
	self deny: s isExpired.
	s expire.
	self assert: s isExpired.
	s := Session new.
	s expirySeconds: 1.
	self deny: s isExpired.
	(Delay forSeconds: 1.5) wait.
	self assert: s isExpired
    ]
]

