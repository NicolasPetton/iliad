
TestCase subclass: ILFileProxyTest [
    | fileProxy |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-lib-HTTP'>

    setUp [
	<category: 'running'>
	fileProxy := ILFileProxy new
    ]

    testTimestamp [
	<category: 'testing'>
	| timeStamp |
	timeStamp := DateTime now.
	self assert: (fileProxy timestampsAt: #foo) = nil.
	fileProxy timestampsAt: #foo put: timeStamp.
	self assert: (fileProxy timestamps at: #foo) = timeStamp
    ]
]

