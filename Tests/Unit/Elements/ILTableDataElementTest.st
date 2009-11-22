
ILElementTest subclass: ILTableDataElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTableDataElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'td'
    ]
]

