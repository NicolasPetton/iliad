ElementTest subclass: RSSCommentsElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    testTag [
	<category: 'testing'>
	self assert: e tag = 'comments'
    ]

    setUp [
	<category: 'running'>
	e := RSSCommentsElement new
    ]
]

