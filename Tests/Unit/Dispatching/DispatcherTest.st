TestCase subclass: DispatcherTest [
    | dispatcher app1 app2 request1 request2 |
    
    <comment: nil>
    <category: 'Iliad-Core-Tests-Dispatching'>

    setUp [
	<category: 'running'>
	dispatcher := Dispatcher current.
	app1 := ApplicationMock1 new.
	app2 := ApplicationMock2 new.
	request1 := Request new url: (Url absolute: '/test1').
	request2 := Request new url: (Url absolute: '/test2')
    ]

    testAbsolutePath [
	<category: 'tests'>
	self assert: (dispatcher absolutePathFor: app1 class) = '/test1'.
	self assert: (dispatcher absolutePathFor: app2 class) = '/test2'
    ]

    testApplicationClass [
	<category: 'tests'>
	| route1 route2 |
	route1 := Route path: #('test1').
	route2 := Route path: #('test2').
	self assert: (dispatcher applicationClassFor: route1) = app1 class.
	self assert: (dispatcher applicationClassFor: route2) = app2 class
    ]

    testFindApplication [
	<category: 'tests'>
	| context |
	context := dispatcher createContextFor: request1.
	CurrentContext use: context
	    during: [self assert: (dispatcher findApplicationFor: context route) = app1].
	context := dispatcher createContextFor: request2.
	CurrentContext use: context
	    during: [self assert: (dispatcher findApplicationFor: context route) = app2]
    ]
]

