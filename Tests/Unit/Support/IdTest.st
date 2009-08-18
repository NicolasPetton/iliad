
TestCase subclass: IdTest [
    | ids |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Support'>

    setUp [
	<category: 'running'>
	ids := OrderedCollection new.
	1000 timesRepeat: [ids add: Id new]
    ]

    testUnicity [
	<category: 'testing'>
	ids do: [:each | self assert: (ids occurrencesOf: each) = 1]
    ]
]

