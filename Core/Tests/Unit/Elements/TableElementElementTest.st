ElementTest subclass: TableElementElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableElementElement new
    ]

    testAlignment [
	<category: 'testing'>
	e alignment: 'foo'.
	self shouldHaveAttribute: 'align' value: 'foo'
    ]

    testVerticalAlignment [
	<category: 'testing'>
	e verticalAlignment: 'foo'.
	self shouldHaveAttribute: 'valign' value: 'foo'
    ]
]

