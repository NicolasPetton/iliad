Object subclass: ILSupport [
    
    <shape: #byte>
    <category: 'Iliad-Core-Support'>
    <comment: nil>

    ILSupport class >> critical: aBlock [
	<category: 'accessing'>
	^self mutex critical: aBlock
    ]

    ILSupport class >> mutex [
	<category: 'accessing'>
	^Semaphore forMutualExclusion
    ]

    ILSupport class >> rfc1123StringFor: aDateTime [
	<category: 'times'>
	^String streamContents: [:stream |
	    self rfc1123StringFor: aDateTime on: stream]
    ]

    ILSupport class >> rfc1123StringFor: aDateTime on: aStream [ 
	"Code taken from Swazoo Timestamp extention with the following comment: FIXME: Assumes 
	server's clock is GMT. Should convert server's clock to GMT if it is not. Besides that, 
	this whole method is really ugly."
	<category: 'times'>
	
	aStream 
	    nextPutAll: (aDateTime dayOfWeekAbbreviation asString);
	    nextPutAll: ', '.
	aDateTime day < 10 ifTrue: [aStream nextPut: $0].
	{aDateTime day printString. aDateTime monthAbbreviation asString. aDateTime year printString} 
	    do: [:each | aStream nextPutAll: each]
	    separatedBy: [aStream nextPut: Character space].
	aStream space.
	{aDateTime hour24. aDateTime minute. aDateTime second}
	    do: [:each | each printOn: aStream]
	    separatedBy: [aStream nextPut: $:].
	aStream nextPutAll: ' GMT'
    ]
]

