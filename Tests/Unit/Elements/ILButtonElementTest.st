
ILElementTest subclass: ILButtonElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILButtonElement new
    ]

    testAccessKey [
	<category: 'testing'>
	e accesskey: $a.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testAttributes [
	<category: 'testing'>
	e beButton.
	self shouldHaveAttribute: 'type' value: 'button'.
	e beReset.
	self shouldHaveAttribute: 'type' value: 'reset'.
	e beSubmit.
	self shouldHaveAttribute: 'type' value: 'submit'
    ]

    testBeforePrintHtml [
	<category: 'testing'>
	e beforePrintHtml.
	self shouldHaveAttribute: 'type' value: 'submit'.
	e type: 'foo'.
	e beforePrintHtml.
	self shouldHaveAttribute: 'type' value: 'foo'
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

