ElementTest subclass: ButtonElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ButtonElement new
    ]

    testAccessKey [
	<category: 'testing'>
	e accesskey: $a.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'button'
    ]

    testType [
	<category: 'testing'>
	e type: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]

    testValue [
	<category: 'testing'>
	e value: 'foo'.
	self shouldHaveAttribute: 'value' value: 'foo'
    ]
]

