TestCase subclass: ActionTest [
    | action |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Buildables'>

    setUp [
	<category: 'running'>
	action := Action new
    ]

    testBlock [
	<category: 'testing'>
	action block: [1 + 1].
	self assert: action block value = 2
    ]

    testEvaluate [
	<category: 'testing'>
	| result |
	result := 2.
	action block: [:it | it + 1].
	action value: result.
	result := action evaluate.
	self assert: result = 3.
	action value: result.
	result := action evaluate.
	self assert: result = 4
    ]
]

