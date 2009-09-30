ElementTest subclass: ListElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ListElement new
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

