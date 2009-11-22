
ILElementTest subclass: ILTableHeaderElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTableHeaderElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'th'
    ]
]

