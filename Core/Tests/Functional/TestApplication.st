Application subclass: TestApplication [
    | counterTest formTest multicounterTest sauTest |
    
    <comment: nil>
    <category: 'Iliad-Tests-Functional'>

    TestApplication class >> path [
	^'tests'
    ]

    allTests [
	<category: 'accessing'>
	^
	{self counterTest.
	self multicounterTest.
	self formTest.
	self sauTest}
    ]

    counterTest [
	<category: 'accessing'>
	^counterTest ifNil: [counterTest := TestCounter new]
    ]

    sauTest [
	<category: 'accessing'>
	^sauTest ifNil: [sauTest := TestSAU new]
    ]

    formTest [
	<category: 'accessing'>
	^formTest ifNil: [formTest := TestForm new]
    ]

    multicounterTest [
	<category: 'accessing'>
	^multicounterTest ifNil: [multicounterTest := TestMultiCounter new]
    ]

    counter [
	<category: 'views'>
	^[:e | 
	    e h2 text: 'Fonctional tests'.
	    e build: self list.
	    e horizontalRule.
	    e add: self counterTest build]
    ]

    form [
	<category: 'views'>
	^[:e | 
	    e h2 text: 'Fonctional tests'.
	    e build: self list.
	    e horizontalRule.
	    e add: self formTest build]
    ]

    index [
	<category: 'views'>
	^self counter
    ]

    multicounter [
	<category: 'views'>
	^[:e |
	    e h2 text: 'Fonctional tests'.
	    e build: self list.
	    e horizontalRule.
	    e add: self multicounterTest build]
    ]

    scriptaculous [
	<category: 'views'>
	^[:e |
	    e h2 text: 'Fonctional tests'.
	    e build: self list.
	    e horizontalRule.
	    e add: self sauTest build]
    ]

    list [
	<category: 'views elements'>
	^[:e || f select |
	    f := e form.
	    select := f select.
	    select
	    beSubmitOnChange;
	    action: [:val | self redirectToLocal: val].
	self allTests do: [:each | select option text: each class path]]
    ]
]

