ElementTest subclass: HorizontalRuleElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := HorizontalRuleElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: (e tag = 'hr')
    ]
]
