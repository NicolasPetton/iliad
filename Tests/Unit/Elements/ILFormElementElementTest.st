
ILElementTest subclass: ILFormElementElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILFormElementElement new
    ]

    testName [
	<category: 'testing'>
	e name: 'foo'.
	self shouldHaveAttribute: 'name' value: 'foo'
    ]

    testReadonly [
	<category: 'testing'>
	e readonly: false.
	self shouldHaveAttribute: 'readonly' value: 'false'
    ]
]

