
TestCase subclass: ILUrlBuilderTest [

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    testAbsolutePath [
	<category: 'testing'>
	| app1 app2 |
	app1 := ILApplicationMock1 new.
	app2 := ILApplicationMock2 new.
	self assert: (ILUrlBuilder default absolutePathFor: app1 class) = '/test'.
	self assert: (ILUrlBuilder default absolutePathFor: app2 class) = '/test/foo'.
    ]
]

