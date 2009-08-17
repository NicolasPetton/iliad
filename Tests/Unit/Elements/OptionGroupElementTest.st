ElementTest subclass: OptionGroupElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := OptionGroupElement new
    ]

    testDisabled [
	<category: 'testing'>
	e disabled.
	self shouldHaveAttribute: 'disabled' value: 'disabled'
    ]

    testLabel [
	<category: 'testing'>
	e label: 'foo'.
	self shouldHaveAttribute: 'label' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'optgroup'
    ]
]

