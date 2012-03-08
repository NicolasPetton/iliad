String subclass: ILId [

    <shape: #character>
    <comment: nil>
    <category: 'Iliad-Core-Utilities'>

    ILId class >> defaultSize [
	<category: 'defaults'>
	^36
    ]

    ILId class >> new [
	<category: 'instance creation'>
	^self new: self defaultSize
    ]

    ILId class >> new: anInteger [
	<category: 'instance creation'>
	^(self basicNew: self defaultSize)
	    initialize;
	    yourself
    ]

    initialize [
	<category: 'initialization'>
	| id |
	id := UUID new printString.
	1 to: self size do: [:each |
	    self at: each put: (id at: each)]	
    ]

    asString [
	<category: 'converting'>
	^String withAll: self
    ]

    printOn: aStream [
	<category: 'printing'>
	aStream nextPutAll: self
    ]
]
