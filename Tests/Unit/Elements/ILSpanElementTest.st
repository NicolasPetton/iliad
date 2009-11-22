
ILElementTest subclass: ILSpanElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILSpanElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'span'
    ]
]

