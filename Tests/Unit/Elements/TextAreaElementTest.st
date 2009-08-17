ElementTest subclass: TextAreaElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TextAreaElement new
    ]

    testColumns [
	<category: 'testing'>
	e columns: 2.
	self shouldHaveAttribute: 'cols' value: '2'
    ]

    testDisabled [
	<category: 'testing'>
	e disabled.
	self shouldHaveAttribute: 'disabled' value: 'disabled'
    ]

    testRows [
	<category: 'testing'>
	e rows: 3.
	self shouldHaveAttribute: 'rows' value: '3'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'textarea'
    ]
]

