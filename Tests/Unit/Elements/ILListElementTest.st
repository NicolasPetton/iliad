
ILElementTest subclass: ILListElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILListElement new
    ]

    testBeOrdered [
	<category: 'testing'>
	e beOrdered.
	self assert: e tag = 'ol'
    ]

    testBeUnordered [
	<category: 'testing'>
	e beUnordered.
	self assert: e tag = 'ul'
    ]
]

