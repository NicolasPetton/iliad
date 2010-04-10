Object subclass: ILEncoder [

    <shape: #byte>
    <category: 'Iliad-Core-Utilities'>
    <comment: nil>

    ILEncoder class [
    
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
	aStream nextPutAll: ((value radix: 16) copyFrom: 4)
	]

	encodeForHTTP: aString [
	    <category: 'encoding'>
	    ^String streamContents: [:stream |
		aString do: [:char |
		    self encodeForHTTP: char on: stream]]
	]

	encodeForHTTP: aCharacter on: aStream [
	    <category: 'encoding'>
	    aCharacter = $" ifTrue: [^aStream nextPutAll: '&quot;'].
	    aCharacter = $< ifTrue: [^aStream nextPutAll: '&lt;'].
	    aCharacter = $& ifTrue: [^aStream nextPutAll: '&amp;'].
	    aCharacter = $> ifTrue: [^aStream nextPutAll: '&gt;'].
	    aStream nextPut: aCharacter
	]	
    ]
]

