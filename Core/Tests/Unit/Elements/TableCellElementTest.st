ElementTest subclass: TableCellElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableCellElement new
    ]

    testAbbreviation [
	<category: 'testing'>
	e abbreviation: 'foo'.
	self shouldHaveAttribute: 'abbr' value: 'foo'
    ]

    testAxis [
	<category: 'testing'>
	e axis: 'foo'.
	self shouldHaveAttribute: 'axis' value: 'foo'
    ]

    testColumnSpan [
	<category: 'testing'>
	e columnSpan: 2.
	self shouldHaveAttribute: 'colspan' value: '2'
    ]

    testHeaders [
	<category: 'testing'>
	e headers: #('foo' 'bar').
	self shouldHaveAttribute: 'headers' value: 'foo,bar'
    ]

    testRowSpan [
	<category: 'testing'>
	e rowSpan: 2.
	self shouldHaveAttribute: 'rowspan' value: '2'
    ]

    testScope [
	<category: 'testing'>
	e scope: 'foo'.
	self shouldHaveAttribute: 'scope' value: 'foo'
    ]
]

