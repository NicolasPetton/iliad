ByteArray subclass: Id [

    <shape: #byte>
    <comment: nil>
    <category: 'Iliad-Core-Utilities'>

    Id class >> defaultSize [
	<category: 'defaults'>
	^32
    ]

    Id class >> new [
	<category: 'instance creation'>
	^self new: self defaultSize
    ]

    Id class >> new: anInteger [
	<category: 'instance creation'>
	^(self basicNew: anInteger)
	    initialize;
	    yourself
    ]

    initialize [
	<category: 'initialization'>
	Support critical: [
		self at: 1 put: ($a to: $z) atRandom asInteger.
		2 to: self size do: [:each |
		    self at: each put: self table atRandom asInteger]]
    ]

    table [
	<category: 'accessing'>
	^($a to: $z) , ($0 to: $9) , (Array with: $_ with: $-)
    ]

    printOn: aStream [
	<category: 'printing'>
	self do: [:each | 
	    aStream nextPut: (Character value: each)]
    ]
]



Character extend [
    
    to: aCharacter [
	^self codePoint
	    to: aCharacter codePoint
	    collect: [:i | Character codePoint: i]
    ]
]
