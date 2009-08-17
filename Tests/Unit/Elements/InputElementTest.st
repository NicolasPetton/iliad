ElementTest subclass: InputElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := InputElement new
    ]

    testAccept [
	<category: 'testing'>
	e accept: 'foo'.
	self shouldHaveAttribute: 'accept' value: 'foo'
    ]

    testAccepts [
	<category: 'testing'>
	e accepts: #('foo' 'bar').
	self shouldHaveAttribute: 'accept' value: 'foo bar'
    ]

    testAccessKey [
	<category: 'testing'>
	e accessKey: 'a'.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testAlternativeText [
	<category: 'testing'>
	e alternativeText: 'foo'.
	self shouldHaveAttribute: 'alt' value: 'foo'
    ]

    testDisabled [
	<category: 'testing'>
	e disabled.
	self shouldHaveAttribute: 'disabled' value: 'disabled'
    ]

    testIsMap [
	<category: 'testing'>
	e isMap.
	self shouldHaveAttribute: 'ismap' value: 'ismap'
    ]

    testMaxLength [
	<category: 'testing'>
	e maxLength: 2.
	self shouldHaveAttribute: 'maxlength' value: '2'
    ]

    testSize [
	<category: 'testing'>
	e size: 2.
	self shouldHaveAttribute: 'size' value: '2'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'input'
    ]

    testType [
	<category: 'testing'>
	e type: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]

    testUseMap [
	<category: 'testing'>
	e useMap: 'foo'.
	self shouldHaveAttribute: 'usemap' value: 'foo'
    ]

    testValue [
	<category: 'testing'>
	e value: 'foo'.
	self shouldHaveAttribute: 'value' value: 'foo'
    ]
]

