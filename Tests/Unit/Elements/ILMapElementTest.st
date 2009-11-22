
ILElementTest subclass: ILMapElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILMapElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'map'
    ]
]

