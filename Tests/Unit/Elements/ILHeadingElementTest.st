ILElementTest subclass: ILHeadingElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILHeadingElement new.
	e level: 2
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'h2'
    ]
]

