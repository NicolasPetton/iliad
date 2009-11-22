
ILElementTest subclass: ILInputElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILInputElement new
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
	e accesskey: $a.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testAlternativeText [
	<category: 'testing'>
	e alt: 'foo'.
	self shouldHaveAttribute: 'alt' value: 'foo'
    ]

    testAttributes [
	<category: 'testing'>
	e beImage.
	self shouldHaveAttribute: 'type' value: 'image'.
	e beHidden.
	self shouldHaveAttribute: 'type' value: 'hidden'.
	e beText.
	self shouldHaveAttribute: 'type' value: 'text'.
	e bePassword.
	self shouldHaveAttribute: 'type' value: 'password'
    ]

    testBeforePrintHtml [
	<category: 'testing'>
	e beforePrintHtml.
	self shouldHaveAttribute: 'type' value: 'text'.
	e type: 'foo'.
	e beforePrintHtml.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]

    testDisabled [
	<category: 'testing'>
	e disabled.
	self shouldHaveAttribute: 'disabled' value: 'disabled'
    ]

    testIsMap [
	<category: 'testing'>
	e ismap.
	self shouldHaveAttribute: 'ismap' value: 'ismap'
    ]

    testMaxLength [
	<category: 'testing'>
	e maxlength: 2.
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
	e usemap: 'foo'.
	self shouldHaveAttribute: 'usemap' value: 'foo'
    ]

    testValue [
	<category: 'testing'>
	e value: 'foo'.
	self shouldHaveAttribute: 'value' value: 'foo'
    ]
]

