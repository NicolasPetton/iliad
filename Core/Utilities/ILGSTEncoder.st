ILEncoder subclass: ILGSTEncoder [
    
    <shape: #byte>
    <comment: nil>
    <category: 'Iliad-Core-Utilities'>

    ILGSTEncoder class >> decode: aString [
	<category: 'encoding'>
	^(I18N.EncodedStream on: aString readStream from: self encoding
	    to: 'ISO-8859-1') contents asString
    ]

    ILGSTEncoder class >> encode: aString [
	<category: 'encoding'>
	^(I18N.EncodedStream on: aString readStream from: 'ISO-8859-1'
	    to: self encoding) contents asString
    ]

    ILGSTEncoder class >> encoding [
	<category: 'accessing'>
	^ILCurrentContext value isNil 
	    ifFalse: [ILCurrentContext value session encoding]
	    ifTrue: ['utf-8']
    ]
]

