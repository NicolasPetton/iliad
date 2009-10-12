ElementTest subclass: TableCellElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableCellElement new
    ]

    testAbbreviation [
	<category: 'testing'>
	e abbr: 'foo'.
	self shouldHaveAttribute: 'abbr' value: 'foo'
    ]

    testAttributes [
	<category: 'testing'>
	e colScope.
	self shouldHaveAttribute: 'scope' value: 'col'.
	e rowgroupScope.
	self shouldHaveAttribute: 'scope' value: 'rowgroup'.
	e colgroupScope.
	self shouldHaveAttribute: 'scope' value: 'colgroup'.
	e rowScope.
	self shouldHaveAttribute: 'scope' value: 'row'
    ]

    testAxis [
	<category: 'testing'>
	e axis: 'foo'.
	self shouldHaveAttribute: 'axis' value: 'foo'
    ]

    testColumnSpan [
	<category: 'testing'>
	e colspan: 2.
	self shouldHaveAttribute: 'colspan' value: '2'
    ]

    testHeaders [
	<category: 'testing'>
	e headers: #('foo' 'bar').
	self shouldHaveAttribute: 'headers' value: 'foo,bar'
    ]

    testRowSpan [
	<category: 'testing'>
	e rowspan: 2.
	self shouldHaveAttribute: 'rowspan' value: '2'
    ]

    testScope [
	<category: 'testing'>
	e scope: 'foo'.
	self shouldHaveAttribute: 'scope' value: 'foo'
    ]
]

