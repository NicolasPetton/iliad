TestCase subclass: ActionRegistryTest [
    | registry |
    
    <comment: nil>
    <category: 'Iliad-Core-Tests-Sessions'>

    setUp [
	<category: 'running'>
	registry := ActionRegistry owner: Widget new
    ]

    testEvaluating [
	<category: 'testing'>
	| action1 action2 |
	action1 := (Action new)
		    block: [#action1];
		    key: Id new;
		    yourself.
	action2 := (Action new)
		    block: [#action2];
		    key: Id new;
		    yourself.
	registry
	    register: action1;
	    register: action2.
	self assert: (registry evaluateActionKey: action1 key) = #action1.
	self assert: (registry evaluateActionKey: action2 key) = #action2.
	self assert: (registry evaluateActionKey: Id new) = nil
    ]

    testRegistering [
	<category: 'testing'>
	| action1 action2 |
	action1 := (Action new)
		    key: Id new;
		    yourself.
	action2 := (Action new)
		    key: Id new;
		    yourself.
	registry
	    register: action1;
	    register: action2.
	self assert: (registry actions includes: action1).
	self assert: (registry actions includes: action2).
	self assert: registry actions size = 2.
	registry unregister: action1.
	self deny: (registry actions includes: action1).
	registry unregisterAllActions.
	self assert: registry actions size = 0
    ]
]

