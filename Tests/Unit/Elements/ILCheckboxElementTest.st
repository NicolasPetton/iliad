
ILElementTest subclass: ILCheckboxElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILCheckboxElement new
    ]

    testAccessKey [
	<category: 'testing'>
	e accesskey: $a.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testBeChecked [
	<category: 'testing'>
	e beChecked.
	self shouldHaveAttribute: 'checked' value: 'checked'
    ]

    testBeforePrintHtml [
	<category: 'testing'>
	e beforePrintHtml.
	self shouldHaveAttribute: 'type' value: 'checkbox'
    ]

    testChecked [
	<category: 'testing'>
	e checked: true.
	self shouldHaveAttribute: 'checked' value: 'checked'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'input'
    ]
]
