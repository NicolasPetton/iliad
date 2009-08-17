ElementTest subclass: OptionElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := OptionElement new
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

    testSelected [
	<category: 'testing'>
	e selected.
	self shouldHaveAttribute: 'selected' value: 'selected'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'option'
    ]

    testValue [
	<category: 'testing'>
	e value: 'foo'.
	self shouldHaveAttribute: 'value' value: 'foo'
    ]
]

