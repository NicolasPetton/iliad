Widget subclass: TestForm [
    | value1 value2 value3 |

    <comment: nil>
    <category: 'Iliad-Tests-Functional'>

    TestForm class >> path [
	^'form'
    ]

    contents [
	^[:e | 
	    e build: self form.
	    e break.
	    e build: self result]
    ]

    form [
	^[:e || form |
	    value1 ifNil: [value1 := ''].
	    value2 ifNil: [value2 := ''].
	    value3 ifNil: [value3 := false].
	    form := e form.
	    form input
		action: [:val | self markDirty. value1 := val];
		value: value1.
	    form break.
	    form textArea
		action: [:val | value2 := val];
		text: value2.
	    form break.
	    form checkbox
		action: [:val | value3 := val];
		checked: value3.
	    form break.
	    form button text: 'go']
    ]

    result [
	^[:e |
	    e text: 'value 1 = ' , value1.
	    e break.
	    e text: 'value 2 = ' , value2.
	    e break.
	    e text: 'value 3 = ' , value3 printString]
    ]
]

