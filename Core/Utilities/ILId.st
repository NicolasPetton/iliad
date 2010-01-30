ByteArray subclass: ILId [

    <shape: #byte>
    <comment: nil>
    <category: 'Iliad-Core-Utilities'>

    ILId class >> defaultSize [
	<category: 'defaults'>
	^12
    ]

    ILId class >> new [
	<category: 'instance creation'>
	^self new: self defaultSize
    ]

    ILId class >> new: anInteger [
	<category: 'instance creation'>
	^(self basicNew: anInteger)
	    initialize;
	    yourself
    ]

    initialize [
	<category: 'initialization'>
	ILSupport critical: [
		self at: 1 put: ($a to: $z) atRandom asInteger.
		2 to: self size do: [:each |
		    self at: each put: self table atRandom asInteger]]
    ]

    table [
	<category: 'accessing'>
	^($a to: $z), ($A to: $Z), ($0 to: $9), (Array with: $_ with: $-)
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
