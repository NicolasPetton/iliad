TestCase subclass: UrlBuilderTest [

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    testAbsolutePath [
	<category: 'testing'>
	| app1 app2 |
	app1 := ApplicationMock1 new.
	app2 := ApplicationMock2 new.
	self assert: (UrlBuilder default absolutePathFor: app1 class) = '/test1'.
	self assert: (UrlBuilder default absolutePathFor: app2 class) = '/test2'.
    ]
]

