ElementTest subclass: MapElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := MapElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'map'
    ]
]

