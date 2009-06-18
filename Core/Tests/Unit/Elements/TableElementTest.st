ElementTest subclass: TableElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableElement new
    ]

    testBorder [
	<category: 'testing'>
	e border: 2.
	self shouldHaveAttribute: 'border' value: '2'
    ]

    testCellPadding [
	<category: 'testing'>
	e cellPadding: 2.
	self shouldHaveAttribute: 'cellpadding' value: '2'
    ]

    testCellSpacing [
	<category: 'testing'>
	e cellSpacing: 2.
	self shouldHaveAttribute: 'cellspacing' value: '2'
    ]

    testFrame [
	<category: 'testing'>
	e frame: 'foo'.
	self shouldHaveAttribute: 'frame' value: 'foo'
    ]

    testRules [
	<category: 'testing'>
	e rules: 'foo'.
	self shouldHaveAttribute: 'rules' value: 'foo'
    ]

    testSummary [
	<category: 'testing'>
	e summary: 'foo'.
	self shouldHaveAttribute: 'summary' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'table'
    ]

    testWidth [
	<category: 'testing'>
	e width: 2.
	self shouldHaveAttribute: 'width' value: '2'
    ]
]

