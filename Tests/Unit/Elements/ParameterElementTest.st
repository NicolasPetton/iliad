ElementTest subclass: ParameterElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ParameterElement new
    ]

    testAdd [
	<category: 'testing'>
	self should: [e add: Element new] raise: ElementError
    ]

    testName [
	<category: 'testing'>
	e name: 'foo'.
	self shouldHaveAttribute: 'name' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'param'
    ]

    testType [
	<category: 'testing'>
	e type: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]

    testValue [
	<category: 'testing'>
	e value: 'foo'.
	self shouldHaveAttribute: 'value' value: 'foo'
    ]

    testValueType [
	<category: 'testing'>
	e valueType: 'foo'.
	self shouldHaveAttribute: 'valuetype' value: 'foo'
    ]
]

