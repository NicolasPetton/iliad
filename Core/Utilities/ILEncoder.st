Object subclass: ILEncoder [

    <category: 'Iliad-Core-Utilities'>
    <comment: nil>

    ILEncoder class [

	printUrl: aString encoded: aBoolean on: aStream [
	    <category: 'encoding'>
	    aBoolean 
		ifTrue: [self encodeUrl: aString on: aStream]
		ifFalse: [aStream nextPutAll: aString]
	]

	encodeUrl: aString on: aStream[
	    <category: 'encoding'>
	    aString do: [:char |
		self encodeUrlCharacter: char on: aStream]
	]	

	encodeUrlCharacter: aCharacter on: aStream [
	    <category: 'encoding'>
	    | value |
	    ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_."' includes: aCharacter)
		ifTrue: [^aStream nextPut: aCharacter].
	    value := aCharacter asInteger.
	    aStream nextPut: $%.
	    aStream nextPutAll: ((value radix: 16) copyFrom: 4)
	]

	encodeForHTTP: aString on: aStream [
	    <category: 'encoding'>
	    aString do: [:char |
		self encodeCharacterForHTTP: char on: aStream]
	]

	encodeCharacterForHTTP: aCharacter on: aStream [
	    <category: 'encoding'>
	    aCharacter = $" ifTrue: [^aStream nextPutAll: '&quot;'].
	    aCharacter = $< ifTrue: [^aStream nextPutAll: '&lt;'].
	    aCharacter = $& ifTrue: [^aStream nextPutAll: '&amp;'].
	    aCharacter = $> ifTrue: [^aStream nextPutAll: '&gt;'].
	    aStream nextPut: aCharacter
	]	
    ]
]
