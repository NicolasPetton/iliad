"======================================================================
|
|   Iliad.ILJson class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from Displomacy written by Avi Bryant
| http://www.squeaksource.com/Diplomacy.
|
| This file is part of the Iliad framework.
|
| Permission is hereby granted, free of charge, to any person obtaining
| a copy of this software and associated documentation files (the 
| 'Software'), to deal in the Software without restriction, including 
| without limitation the rights to use, copy, modify, merge, publish, 
| distribute, sublicense, and/or sell copies of the Software, and to 
| permit persons to whom the Software is furnished to do so, subject to 
| the following conditions:
|
| The above copyright notice and this permission notice shall be 
| included in all copies or substantial portions of the Software.
|
| THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
|
 ======================================================================"



ILObject subclass: ILJson [
    | stream ctorMap |
    
    <category: 'Iliad-Core-lib-JSON'>
    <comment: 'This class reads and writes JSON format data - strings, numbers, 
boolean, nil, arrays and dictionaries. 
See http://www.crockford.com/JSON/index.html. 
It has been extended with syntax for invoking a prearranged list of constructors on read objects.'>

    CharacterEscapeMap := nil.

    ILJson class >> escapeForCharacter: c [
	^CharacterEscapeMap at: c ifAbsent: [nil]
    ]

    ILJson class >> initialize [
	"ILJson initialize."

	CharacterEscapeMap := Dictionary new
	    at: $" put: $";
	    at: $\ put: $\;
	    at: Character backspace put: $b;
	    at: Character lf put: $n;
	    at: Character newPage put: $f;
	    at: Character cr put: $r;
	    at: Character tab put: $t;
	    yourself
    ]

    ILJson class >> mimeType [
	^'application/json'
    ]

    ILJson class >> newWithConstructors: aCollection [
	| m |
	m := Dictionary new.
	aCollection do: [:each | 
	    (each isKindOf: Association) 
		ifTrue: [m add: each]
		ifFalse: [m at: each printString put: each]].
	^self new
	    ctorMap: m;
	    yourself
    ]

    ILJson class >> numbersMayContain: aChar [
	^aChar isDigit or: [#($- $+ $. $e $E) includes: aChar]
    ]

    ILJson class >> readFrom: aStream [
	^self new readFrom: aStream
    ]

    ILJson class >> render: anObject [
	| s |
	s := WriteStream on: String new.
	anObject printJsonOn: s.
	^s contents
    ]

    ILJson class >> render: anObject withConstructor: aConstructorName on: aStream [
	aStream nextPutAll: '@' , aConstructorName.
	anObject printJsonOn: aStream
    ]

    ILJson class >> renderInstanceVariables: aCollection of: anObject on: aStream [
	| map |
	map := Dictionary new.
	aCollection 
	    do: [:ivarName | map at: ivarName put: (anObject instVarNamed: ivarName)].
	self 
	    render: map
	    withConstructor: anObject class name asString
	    on: aStream
    ]

    ctorMap [
	<category: 'accessing'>
	^ctorMap
    ]

    ctorMap: m [
	<category: 'accessing'>
	ctorMap := m
    ]

    stream [
	"Answer the value of stream"

	<category: 'accessing'>
	^stream
    ]

    stream: anObject [
	"Set the value of stream"

	<category: 'accessing'>
	stream := anObject
    ]

    readAny [
	"This is the main entry point for the JSON parser. See also readFrom: on the class side."

	<category: 'parsing'>
	| c |
	self skipWhitespace.
	c := self peek asLowercase.
	c == ${ 
	    ifTrue: [
		self next.
		^self readDictionary].
	c == $[ 
	    ifTrue: [
		self next.
		^self readArray].
	c == $" 
	    ifTrue: [
		self next.
		^self readString].
	c == $t ifTrue: [^self consume: 'true' returning: true].
	c == $f ifTrue: [^self consume: 'false' returning: false].
	c == $n ifTrue: [^self consume: 'null' returning: nil].
	c == $@ 
	    ifTrue: [
		self next.
		^self readConstructor].
	(ILJson numbersMayContain: c) ifTrue: [^self readNumber].
	ILJsonSyntaxError signal: 'Unknown Json input'
    ]

    readFrom: aStream [
	<category: 'parsing'>
	self stream: aStream.
	^self readAny
    ]
    
    consume: aString returning: anObject [
	<category: 'private'>
	aString do: [:c | 
	    self next == c ifFalse: [
		ILJsonSyntaxError signal: 'Expected ''' , aString , '''']].
	^anObject
    ]

    interpretStringEscape [
	<category: 'private'>
	| c |
	c := self next.
	c == $b ifTrue: [^Character backspace].
	c == $n ifTrue: [^Character lf].
	c == $f ifTrue: [^Character newPage].
	c == $r ifTrue: [^Character cr].
	c == $t ifTrue: [^Character tab].
	^c
    ]

    next [
	<category: 'private'>
	^self stream next
    ]

    peek [
	<category: 'private'>
	^self stream peek
    ]

    readArray [
	<category: 'private'>
	| a needComma |
	a := OrderedCollection new.
	needComma := false.
	
	[self skipWhitespace.
	self peek == $] 
	    ifTrue: [
		self next.
		^a asArray].
	needComma 
	    ifTrue: [
		self peek == $, ifFalse: [ILJsonSyntaxError signal: 'Missing comma'].
		self next]
	    ifFalse: [needComma := true].
	a add: self readAny] 
		repeat
    ]

    readConstructor [
	<category: 'private'>
	| s c v ctor |
	s := WriteStream on: ''.
	
	[c := self peek.
	c ifNil: [
	    ILJsonSyntaxError signal: 'Premature EOF reading constructor name'].
	(c == $. or: [c isLetter]) 
	    ifTrue: [
		s nextPut: c.
		self next]
	    ifFalse: [
		v := self readAny.
		s := s contents.
		ctor := ctorMap ifNotNil: [ctor := ctorMap at: s ifAbsent: [nil]].
		ctor ifNil: [ILJsonSyntaxError signal: 'Unknown ctor ' , s].
		^ctor constructFromJson: v]] 
		repeat
    ]

    readDictionary [
	<category: 'private'>
	| m k v needComma |
	m := Dictionary new.
	needComma := false.
	
	[self skipWhitespace.
	self peek == $} 
	    ifTrue: [self next. ^m].
	needComma 
	    ifTrue: [
		self peek == $, ifFalse: [ILJsonSyntaxError signal: 'Missing comma'].
		self next.
		self skipWhitespace]
	    ifFalse: [needComma := true].
	self next == $" 
	    ifFalse: [ILJsonSyntaxError signal: 'Key in dictionary must be string'].
	k := self readString.
	self skipWhitespace.
	self peek == $: ifFalse: [ILJsonSyntaxError signal: 'Missing colon'].
	self next.
	v := self readAny.
	m at: k put: v] 
	    repeat
    ]

    readNumber [
	<category: 'private'>
	| acc c |
	acc := WriteStream on: ''.
	
	[c := self peek.
	(c isNil not and: [ILJson numbersMayContain: c]) 
	    ifFalse: [[^acc contents asNumber] 
                on: Error
		do: [ILJsonSyntaxError signal: 'Invalid number']].
	acc nextPut: c.
	self next] 
	    repeat
    ]

    readString [
	<category: 'private'>
	| s c |
	s := WriteStream on: ''.
	
	[c := self next.
	c == $\ 
	    ifTrue: [s nextPut: self interpretStringEscape]
	    ifFalse: [
		c == $" ifTrue: [^s contents].
		s nextPut: c]] 
	    repeat
    ]

    skipComment [
	<category: 'private'>
	self peek == $/ 
	    ifTrue: [
		self next.
		self peek == $/ 
		    ifTrue: [self skipToEndOfLine]
		    ifFalse: [
			self peek == $* 
                        ifTrue: [
			    self next.
			    self skipCommentBody]
			ifFalse: [ILJsonSyntaxError signal: 'Invalid comment syntax']]]
    ]

    skipCommentBody [
	<category: 'private'>
	
	[[self next == $*] whileFalse.
	self peek == $/] whileFalse.
	self next.	"skip that last slash"
	self skipWhitespace
    ]

    skipToEndOfLine [
	<category: 'private'>
	[self peek == Character cr or: [self peek == Character lf]] 
	    whileFalse: [self next].
	self skipWhitespace
    ]

    skipWhitespace [
	<category: 'private'>
	[self peek isSeparator] whileTrue: [self next].
	self skipComment
    ]
]

Eval [
    ILJson initialize
]

