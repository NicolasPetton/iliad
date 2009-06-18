Encoder subclass: GSTEncoder [
    
    <shape: #byte>
    <comment: nil>
    <category: 'Iliad-Core-Utilities'>

    GSTEncoder class >> decode: aString [
	<category: 'encoding'>
	^(I18N.EncodedStream on: aString readStream from: self encoding
	    to: 'ISO-8859-1') contents asString
    ]

    GSTEncoder class >> encode: aString [
	<category: 'encoding'>
	^(I18N.EncodedStream on: aString readStream from: 'ISO-8859-1'
	    to: self encoding) contents asString
    ]

    GSTEncoder class >> encoding [
	<category: 'accessing'>
	^CurrentContext value isNil 
	    ifFalse: [CurrentContext value session encoding]
	    ifTrue: ['utf-8']
    ]
]

