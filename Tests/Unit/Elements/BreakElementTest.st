ElementTest subclass: BreakElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := BreakElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: (e tag = 'br')
    ]
]

