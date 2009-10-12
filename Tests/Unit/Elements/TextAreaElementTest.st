ElementTest subclass: TextAreaElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TextAreaElement new
    ]

    testCols [
	<category: 'testing'>
	e cols: 3.
	self shouldHaveAttribute: 'cols' value: '3'
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

    testTabindex [
	<category: 'testing'>
	e tabindex: 3.
	self shouldHaveAttribute: 'tabindex' value: '3'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'textarea'
    ]
]

