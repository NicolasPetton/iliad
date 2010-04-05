Grease.GRGSTPlatform extend [

    asMethodReturningString: aByteArrayOrString named: aSymbol [
	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a String"
	<category: '*Iliad-Core-GST'>
	^String streamContents: [ :stream |
		stream nextPutAll: aSymbol; nextPutAll: ' [ '; nl.
		stream tab; nextPutAll: '    ^'.
		aByteArrayOrString storeLiteralOn: stream.
		stream nl; nextPutAll: ']' ]
    ]
]
