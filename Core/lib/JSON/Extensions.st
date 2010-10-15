"======================================================================
|
|   Smalltalk class extensions
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



Number extend [
    
    printJsonOn: aStream [
	<category: 'printing'>
	aStream nextPutAll: self greaseString
    ]
]

Collection extend [

    printJsonOn: aStream [
	<category: 'printing'>
	| needComma |
	needComma := false.
	aStream nextPut: $[.
	self do: [:v |
	    needComma
		ifTrue: [ aStream nextPutAll: ', ' ]
		ifFalse: [ needComma := true ].
	    v printJsonOn: aStream].
	aStream nextPut: $].
    ]
]

Dictionary extend [
    
    printJsonOn: aStream [
	<category: 'printing'>
	| needComma |
	needComma := false.
	aStream nextPut: ${.
	self keysAndValuesDo: [:k :v |
	    needComma
		ifTrue: [ aStream nextPutAll: ', ' ]
		ifFalse: [ needComma := true ].
	k greaseString printJsonOn: aStream.
	aStream nextPutAll: ': '.
	v printJsonOn: aStream].
	aStream nextPut: $}.
    ]
]



String extend [
    
    printJsonOn: aStream [
	<category: 'printing'>
	| replacement |
	aStream nextPut: $".
	self do: [:ch |
	    replacement := Iliad.ILJson escapeForCharacter: ch.
	    replacement
		ifNil: [ aStream nextPut: ch ]
		ifNotNil: [ aStream nextPut: $\; nextPut: replacement ]].
	aStream nextPut: $".
    ]
]

True extend [

    printJsonOn: aStream [
	<category: 'printing'>
	aStream nextPutAll: 'true'
    ]
]

False extend [

    printJsonOn: aStream [
	<category: 'printing'>
	aStream nextPutAll: 'false'
    ]
]

UndefinedObject extend [

    printJsonOn: aWriteStream [
	<category: 'printing'>
	aWriteStream nextPutAll: 'null'
    ]
]

WriteStream extend [

    jsonPrint: anObject [
	<category: 'printing'>
	anObject printJsonOn: self
    ]
]
