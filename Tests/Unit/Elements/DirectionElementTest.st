ElementTest subclass: DirectionElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := DirectionElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'bdo'
    ]
]

