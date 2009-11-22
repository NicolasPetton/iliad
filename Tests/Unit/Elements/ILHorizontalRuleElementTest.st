
ILElementTest subclass: ILHorizontalRuleElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILHorizontalRuleElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: (e tag = 'hr')
    ]
]
