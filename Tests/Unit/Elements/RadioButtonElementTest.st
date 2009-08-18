ElementTest subclass: RadioButtonElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := RadioButtonElement new
    ]

    testBeSelected [
	e beSelected.
	self shouldHaveAttribute: #checked value: 'checked'
    ]

    testBeforePrintHtml [
	e beforePrintHtml.
	self shouldHaveAttribute: 'type' value: 'radio'
    ]

    testSelected [
	e selected: true.
	self shouldHaveAttribute: #checked value: 'checked'
    ]

    testValue [
	e value: 'foo'.
	self shouldHaveAttribute: 'value' value: 'foo'
    ]
]

