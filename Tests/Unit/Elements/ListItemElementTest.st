ElementTest subclass: ListItemElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := ListItemElement new
    ]

    testTag [
	self assert: e tag = 'li'
    ]
]

