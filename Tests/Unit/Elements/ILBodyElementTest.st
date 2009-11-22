
ILElementTest subclass: ILBodyElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILBodyElement new
    ]

    testOnLoad [
	<category: 'testing'>
	e onLoad: 'foo'.
	self shouldHaveAttribute: 'onLoad' value: 'foo'
    ]

    testOnUnload [
	<category: 'testing'>
	e onUnload: 'foo'.
	self shouldHaveAttribute: 'onUnload' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: (e tag = 'body')
    ]
]

