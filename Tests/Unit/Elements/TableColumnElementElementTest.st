ElementTest subclass: TableColumnElementElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableColumnElementElement new
    ]

    testRelativeWidth [
	<category: 'testing'>
	e relativeWidth: 'foo'.
	self shouldHaveAttribute: 'width' value: 'foo'
    ]

    testSpan [
	<category: 'testing'>
	e span: 2.
	self shouldHaveAttribute: 'span' value: '2'
    ]
]

