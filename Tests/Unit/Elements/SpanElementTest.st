ElementTest subclass: SpanElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := SpanElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'span'
    ]
]

