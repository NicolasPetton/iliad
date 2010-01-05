ILEncoder subclass: ILGSTEncoder [

    <shape: #byte>
    <comment: nil>
    <category: 'Iliad-Core-GST'>

    ILGSTEncoder class [ 
	| inputEncoding |

	decode: aString [
	    <category: 'encoding'>
	    ^self inputEncoding asLowercase = self outputEncoding asLowercase
		ifTrue: [aString]
		ifFalse: [(I18N.EncodedStream on: aString readStream from: self outputEncoding
		    to: self inputEncoding) contents asString]
	]

	encode: aString [
	    <category: 'encoding'>
	    ^self inputEncoding asLowercase = self outputEncoding asLowercase
		ifTrue: [aString]
		ifFalse: [^(I18N.EncodedStream on: aString readStream from: self inputEncoding
		    to: self outputEncoding) contents asString]
	]

	inputEncoding [
	    <category: 'accessing'>
	    ^inputEncoding ifNil: [self outputEncoding]
	]

	inputEncoding: aString [
	    <category: 'accessing'>
	    inputEncoding := aString
	]

	outputEncoding [
	    <category: 'accessing'>
	    ^ILCurrentContext value isNil 
		ifFalse: [ILCurrentContext value session encoding]
		ifTrue: ['utf-8']
	]
    ]
]

