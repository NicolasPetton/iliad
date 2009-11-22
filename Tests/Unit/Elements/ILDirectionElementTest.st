
ILElementTest subclass: ILDirectionElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILDirectionElement new
    ]

    testDir [
	<category: 'testing'>
	e dir: 'foo'.
	self shouldHaveAttribute: 'dir' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'bdo'
    ]
]

