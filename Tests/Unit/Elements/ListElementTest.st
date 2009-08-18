ElementTest subclass: ListElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Elements'>

    setUp [
	e := ListElement new
    ]

    testBeOrdered [
	e beOrdered.
	self assert: e tag = 'ol'
    ]

    testBeUnordered [
	e beUnordered.
	self assert: e tag = 'ul'
    ]
]

