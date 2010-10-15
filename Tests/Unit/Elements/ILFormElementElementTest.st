ILElementTest subclass: ILFormElementElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILFormElementElement new
    ]

    testBeSubmit [
	<category: 'testing'>
	| script |
	script := 'iliad.evaluateFormElementAction(this)'.
	e beSubmitOnEvent: 'foo'.
	self assert: (e attributeAt: 'onfoo') = script.
	e beSubmitOnClick.
	self assert: (e attributeAt: 'onclick') = script.
	e beSubmitOnChange.
	self assert: (e attributeAt: 'onchange') = script
    ]

    testName [
	<category: 'testing'>
	e name: 'foo'.
	self assert: (e name = 'foo')
    ]

    testReadonly [
	<category: 'testing'>
	e readonly: false.
	self shouldHaveAttribute: 'readonly' value: 'false'
    ]
]

