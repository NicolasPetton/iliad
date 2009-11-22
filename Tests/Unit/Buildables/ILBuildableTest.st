
TestCase subclass: ILBuildableTest [
    | buildable |
    
    <comment: nil>
    <category: 'Iliad-Tests-Buildables'>

    setUp [
	<category: 'running'>
	buildable := ILBuildable new
    ]

    testAttributes [
	<category: 'testing'>
	buildable attributeAt: #foo put: 'bar'.
	self assert: (buildable attributes at: #foo) = 'bar'
    ]
]

