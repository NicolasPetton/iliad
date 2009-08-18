ElementTest subclass: SpanElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := SpanElement new
    ]

    testTag [
	self assert: e tag = 'span'
    ]
]

