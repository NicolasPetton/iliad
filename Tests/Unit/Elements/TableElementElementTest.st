ElementTest subclass: TableElementElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableElementElement new
    ]

    testAlignment [
	<category: 'testing'>
	e align: 'foo'.
	self shouldHaveAttribute: 'align' value: 'foo'
    ]

    testVerticalAlignment [
	<category: 'testing'>
	e valign: 'foo'.
	self shouldHaveAttribute: 'valign' value: 'foo'
    ]
]

