ElementTest subclass: RubyTextElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := RubyTextElement new
    ]

    testRubyBaseSpan [
	<category: 'testing'>
	e rbspan: 2.
	self shouldHaveAttribute: 'rbspan' value: '2'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'rt'
    ]
]

