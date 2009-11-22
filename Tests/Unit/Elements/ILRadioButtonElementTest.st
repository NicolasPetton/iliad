
ILElementTest subclass: ILRadioButtonElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILRadioButtonElement new
    ]

    testBeSelected [
	<category: 'testing'>
	e beSelected.
	self shouldHaveAttribute: 'checked' value: 'checked'
    ]

    testBeforePrintHtml [
	<category: 'testing'>
	e beforePrintHtml.
	self shouldHaveAttribute: 'type' value: 'radio'
    ]

    testSelected [
	<category: 'testing'>
	e selected: true.
	self shouldHaveAttribute: 'checked' value: 'checked'
    ]

    testValue [
	<category: 'testing'>
	e value: 'foo'.
	self shouldHaveAttribute: 'value' value: 'foo'
    ]
]

