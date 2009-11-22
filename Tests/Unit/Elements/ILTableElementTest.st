
ILElementTest subclass: ILTableElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTableElement new
    ]

    testAttributes [
	<category: 'testing'>
	e rhsFrame.
	self shouldHaveAttribute: 'frame' value: 'rhs'.
	e vsidesFrame.
	self shouldHaveAttribute: 'frame' value: 'vsides'.
	e aboveFrame.
	self shouldHaveAttribute: 'frame' value: 'above'.
	e groupRules.
	self shouldHaveAttribute: 'rules' value: 'groups'.
	e hsidesFrame.
	self shouldHaveAttribute: 'frame' value: 'hsides'.
	e colsRules.
	self shouldHaveAttribute: 'rules' value: 'cols'.
	e noRules.
	self shouldHaveAttribute: 'rules' value: 'none'.
	e boxFrame.
	self shouldHaveAttribute: 'frame' value: 'box'.
	e rowsRules.
	self shouldHaveAttribute: 'rules' value: 'rows'.
	e voidFrame.
	self shouldHaveAttribute: 'frame' value: 'void'.
	e allRules.
	self shouldHaveAttribute: 'rules' value: 'all'.
	e belowFrame.
	self shouldHaveAttribute: 'frame' value: 'below'.
	e lhsFrame.
	self shouldHaveAttribute: 'frame' value: 'lhs'.
	e borderFrame.
	self shouldHaveAttribute: 'frame' value: 'border'
    ]

    testBorder [
	<category: 'testing'>
	e border: 2.
	self shouldHaveAttribute: 'border' value: '2'
    ]

    testCellPadding [
	<category: 'testing'>
	e cellpadding: 2.
	self shouldHaveAttribute: 'cellpadding' value: '2'
    ]

    testCellSpacing [
	<category: 'testing'>
	e cellspacing: 2.
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

