ElementTest subclass: ListItemElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ListItemElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'li'
    ]
]

