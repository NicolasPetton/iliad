ElementTest subclass: BodyElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := BodyElement new
    ]

    testOnLoad [
	<category: 'tests'>
	e onLoad: 'foo'.
	self shouldHaveAttribute: 'onLoad' value: 'foo'
    ]

    testOnUnload [
	<category: 'tests'>
	e onUnload: 'foo'.
	self shouldHaveAttribute: 'onUnload' value: 'foo'
    ]
]

