Widget subclass: TestCounter [
    | counters counter |
    <comment: nil>
    <category: 'Iliad-Tests-Functional'>

    TestCounter class >> path [
	^'counter'
    ]

    contents [
	^[:e | e add: self counter build]
    ]

    children [
	^Array with: self counter
    ]

    counter [
	^counter ifNil: [counter := Counter new]
    ]
]

