TestCase subclass: ILDispatcherTest [
    | dispatcher app1 app2 request1 request2 |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Dispatching'>

    setUp [
	<category: 'running'>
	dispatcher := ILDispatcher current.
	app1 := ILApplicationMock1 new.
	app2 := ILApplicationMock2 new.
	request1 := ILRequest new 
	    url: (ILUrl absolute: '/test/foo').
	request2 := ILRequest new
	    url: (ILUrl absolute: '/test').
	ILApplicationMock1 path: 'test'.
	ILApplicationMock2 path: 'test/foo'
    ]

    tearDown [
	<category: 'running'>
	ILApplicationMock1 path: nil.
	ILApplicationMock2 path: nil
    ]

    testApplicationClass [
	<category: 'tests'>
	| route1 route2 |
	route1 := ILRoute path: #('test' 'foo').
	route2 := ILRoute path: #('test').
	ILCurrentContext use: ILContext new during: [
	    self assert: ((dispatcher applicationClassFor: route1) = app2 class).
	    self assert: ((dispatcher applicationClassFor: route2) = app1 class)]
    ]

    testFindApplication [
	<category: 'tests'>
	| context |
	context := dispatcher createContextFor: request1.
	ILCurrentContext use: context during: [
	    context session applications at: app2 class put: app2.
	    self assert: ((dispatcher findApplicationFor: context route) = app2)].
	context := dispatcher createContextFor: request2.
	ILCurrentContext use: context during: [
	    context session applications at: app1 class put: app1.
	    self assert: ((dispatcher findApplicationFor: context route) = app1)]
    ]
]

