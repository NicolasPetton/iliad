Widget subclass: TestMultiCounter [
    | counters |

    <comment: nil>
    <category: 'Iliad-Tests-Functional'>

    TestMultiCounter class >> path [
	^'multicounter'
    ]

    contents [
	^[:e | self counters do: [:each | e add: each build]]
    ]

    counters [
	^counters ifNil: [counters := self initCounters]
    ]

    initCounters [
	^
	{Counter new.
	Counter new.
	Counter new.
	Counter new.
	Counter new}
    ]
]

