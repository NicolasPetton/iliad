
TestCase subclass: ILBuildableTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Buildables'>

    testAttributes [
	<category: 'testing'>
	| buildable |
	buildable := ILBuildable new.
	buildable attributeAt: #foo put: 'bar'.
	self assert: (buildable attributes at: #foo) = 'bar'
    ]

    testBuild [
	<category: 'testing'>
	| e buildable |
	e := ILElement new.
	buildable := ILBuildableMock new.
	e build: buildable.
	self assert: (e children size = 1).
	self assert: (e children first == buildable rootElement)
    ] 

    testBuildBlock [
	<category: 'testing'>
	| e e2 block |
	e := ILElement new.
	e2 := ILElement new.
	block := [:element | element add: e2].
	e build: block.
	self assert: (e children size = 1).
	self assert: (e children first == e2)
    ]
]

