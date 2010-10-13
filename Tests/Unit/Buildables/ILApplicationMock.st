ILApplication subclass: ILApplicationMock [
    | w1 w2 w3 |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Buildables'>

    ILApplicationMock class [
	| path |
	
	path [
	    <category: 'accessing'>
	    ^path ifNil: ['']
	]

	path: aString [
	    <category: 'accessing'>
	    path := aString
	]
    ]


    initialize [
	<category: 'initialization'>
	super initialize.
	w1 := ILWidgetMock1 new.
	w2 := ILWidgetMock2 new.
	w3 := ILWidgetMock3 new.
    ]

    w1 [
	<category: 'accessing'>
	^w1
    ]

    w2 [
	<category: 'accessing'>
	^w2
    ]

    w3 [
	<category: 'accessing'>
	^w3
    ]

    index [
	<category: 'controllers'>
	^[:e |
	    e build: w1; build: w2; build: w3]
    ]
]

