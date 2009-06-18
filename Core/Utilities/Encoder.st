Object subclass: Encoder [

    <shape: #byte>
    <category: 'Iliad-Core-Base'>
    <comment: nil>

    Encoder class [
    
	encodeUrl: aString [
	    <category: 'encoding'>
	    ^String streamContents: [:stream |
		aString do: [:char |
		    self encodeUrl: char on: stream]]
	]	

	encodeUrl: aCharacter on: aStream [
	    <category: 'encoding'>
	    | value |
	('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_."' includes: aCharacter)
	    ifTrue: [^aStream nextPut: aCharacter].
	value := aCharacter asInteger.
	aStream nextPut: $%.
	aStream nextPutAll: ((value printStringBase: 16) padded: #left to: 2 with: $0)
	]

	encodeForHTTP: aString [
	    <category: 'encoding'>
	    | stream |
	    stream := WriteStream on: String new.
	    aString do: [:char |
		self encodeForHTTP: char on: stream].
	    ^stream contents
	]

	encodeForHTTP: aCharacter on: aStream [
	    <category: 'encoding'>
	    aCharacter = $" ifTrue: [^aStream nextPutAll: '&quot;'].
	    aCharacter = $< ifTrue: [^aStream nextPutAll: '&lt;'].
	    aCharacter = $& ifTrue: [^aStream nextPutAll: '&amp;'].
	    aCharacter = $> ifTrue: [^aStream nextPutAll: '&gt;'].
	    aStream nextPut: aCharacter
	]	

	encode: aString [
	    <category: 'encoding'>
	    ^aString 
	]
	
	decode: aString [
	    <category: 'encoding'>
	    ^aString 
	]
    ]
]

