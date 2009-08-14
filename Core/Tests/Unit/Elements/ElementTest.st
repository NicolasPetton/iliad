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
]

