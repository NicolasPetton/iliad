
ILElementTest subclass: ILBreakElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILBreakElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: (e tag = 'br')
    ]
]

