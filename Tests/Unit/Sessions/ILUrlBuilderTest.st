TestCase subclass: ILUrlBuilderTest [

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    setUp [
	<category: 'running'>
	ILApplicationMock1 path: 'test'.
	ILApplicationMock2 path: 'test/foo'
    ]

    tearDown [
	<category: 'running'>
	ILApplicationMock1 path: nil.
	ILApplicationMock2 path: nil
    ]

    testUrlForApplicationClass [
	<category: 'testing'>
	| app1 app2 |
	app1 := ILApplicationMock1 new.
	app2 := ILApplicationMock2 new.
	self assert: (ILUrlBuilder new urlForApplicationClass: app1 class) asString = '/test'.
	self assert: (ILUrlBuilder new urlForApplicationClass: app2 class) asString = '/test/foo'.
    ]
]

