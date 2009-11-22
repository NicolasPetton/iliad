
TestCase subclass: ILActionRegistryTest [
    | registry |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    setUp [
	<category: 'running'>
	registry := ILActionRegistry owner: ILWidget new
    ]

    testEvaluating [
	<category: 'testing'>
	| action1 action2 |
	action1 := ILAction new
	    block: [#action1];
	    key: ILId new;
	    yourself.
	action2 := ILAction new
	    block: [#action2];
	    key: ILId new;
	    yourself.
	registry
	    register: action1;
	    register: action2.
	self assert: (registry evaluateActionKey: action1 key) = #action1.
	self assert: (registry evaluateActionKey: action2 key) = #action2.
	self assert: (registry evaluateActionKey: ILId new) = nil
    ]

    testRegistering [
	<category: 'testing'>
	| action1 action2 |
	action1 := ILAction new
	    key: ILId new;
	    yourself.
	action2 := ILAction new
	    key: ILId new;
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

