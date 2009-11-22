
TestCase subclass: ILIdTest [
    | ids |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Utilities'>

    setUp [
	<category: 'running'>
	ids := OrderedCollection new.
	1000 timesRepeat: [ids add: ILId new]
    ]

    testUnicity [
	<category: 'testing'>
	ids do: [:each | self assert: (ids occurrencesOf: each) = 1]
    ]
]

