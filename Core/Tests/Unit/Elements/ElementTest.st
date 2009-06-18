TestCase subclass: ElementTest [
    | e |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := Element new
    ]

    shouldHaveAttribute: aKey value: aValue [
	<category: 'conveniance'>
	self assert: (e attributes includesAssociation: aKey -> aValue)
    ]

    testAttributes [
	<category: 'testing'>
	self assert: e attributes isEmpty.
	e attributeAt: 'foo' put: 'bar'.
	self shouldHaveAttribute: 'foo' value: 'bar'
    ]

    testComposite [
	<category: 'testing'>
	| e1 e2 |
	e1 := e2 := Element new.
	self assert: e children isEmpty.
	e add: e1.
	self assert: e children asArray = (Array with: e1).
	e add: e2.
	self assert: e children asArray = (Array with: e1 with: e2)
    ]
]

