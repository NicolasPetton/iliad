TestCase subclass: DispatcherTest [
    | dispatcher app1 app2 request1 request2 |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Dispatching'>

    setUp [
	<category: 'running'>
	dispatcher := Dispatcher current.
	app1 := ApplicationMock1 new.
	app2 := ApplicationMock2 new.
	request1 := Request new 
	    url: (Url absolute: '/test/foo').
	request2 := Request new
	    url: (Url absolute: '/test')
    ]

    testApplicationClass [
	<category: 'tests'>
	| route1 route2 |
	route1 := Route path: #('test' 'foo').
	route2 := Route path: #('test').
	CurrentContext use: Context new during: [
	    self assert: ((dispatcher applicationClassFor: route1) = app2 class).
	    self assert: ((dispatcher applicationClassFor: route2) = app1 class)]
    ]

    testFindApplication [
	<category: 'tests'>
	| context |
	context := dispatcher createContextFor: request1.
	CurrentContext use: context during: [
		context session applications at: app2 class put: app2.
		self assert: ((dispatcher findApplicationFor: context route) = app2)].
	context := dispatcher createContextFor: request2.
	CurrentContext use: context during: [
		context session applications at: app1 class put: app1.
		self assert: ((dispatcher findApplicationFor: context route) = app1)]
    ]
]

