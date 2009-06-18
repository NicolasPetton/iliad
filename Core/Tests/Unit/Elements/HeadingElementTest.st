ElementTest subclass: HeadingElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := HeadingElement new.
	e level: 2
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'h2'
    ]
]

