
Object subclass: ILJsonDummyTestObject [
    | a b c |
    
    <category: 'Iliad-Tests-Unit-lib-JSON'>
    <comment: nil>

    ILJsonDummyTestObject class >> constructFromJson: j [
	^(self new)
	    a: (j at: 'a');
	    b: (j at: 'b');
	    c: (j at: 'c');
	    yourself
    ]

    = other [
	<category: 'running'>
	^other class == self class 
	    and: [a = other a and: [b = other b and: [c = other c]]]
    ]

    a [
	"Answer the value of a"

	<category: 'accessing'>
	^a
    ]

    a: anObject [
	"Set the value of a"

	<category: 'accessing'>
	a := anObject
    ]

    b [
	"Answer the value of b"

	<category: 'accessing'>
	^b
    ]

    b: anObject [
	"Set the value of b"

	<category: 'accessing'>
	b := anObject
    ]

    c [
	"Answer the value of c"

	<category: 'accessing'>
	^c
    ]

    c: anObject [
	"Set the value of c"

	<category: 'accessing'>
	c := anObject
    ]
    
    printJsonOn: s [
	<category: 'Iliad-Core-lib-JSON-printing'>
	ILJson 
	    renderInstanceVariables: 
		{#a.
		#b.
		#c}
	    of: self
	    on: s
    ]
]

