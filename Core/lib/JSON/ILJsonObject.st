"======================================================================
|
|   Iliad.ILJsonObject class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| From Displomacy written by Avi Bryant
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



ILObject subclass: ILJsonObject [
    | properties |
    
    <category: 'Iliad-Core-lib-JSON'>
    <comment: nil>

    initialize [
	<category: 'initialization'>
	super initialize.
	properties := OrderedCollection new
    ]

    at: key [
	<category: 'accessing'>
	^self at: key ifAbsent: [nil]
    ]

    at: key ifAbsent: aBlock [
	<category: 'accessing'>
	^(properties 
	    detect: [:ea | ea key = key] 
	    ifNone: [^aBlock value]) value
    ]

    at: key put: value [
	<category: 'accessing'>
	properties add: key -> value
    ]

    properties [
	<category: 'accessing'>
	^properties
    ]

    doesNotUnderstand: aMessage [
	<category: 'error handling'>
	| key |
	key := aMessage selector.
	key isUnary 
	    ifTrue: [^self at: key ifAbsent: [super doesNotUnderstand: aMessage]].
	^(key isKeyword and: [(key occurrencesOf: $:) = 1]) 
	    ifTrue: 
		[key := key allButLast asSymbol.
		self at: key put: aMessage arguments first]
	    ifFalse: [super doesNotUnderstand: aMessage]
    ]

    printJsonOn: aStream [
	aStream nextPut: ${.
	properties do: [:ea | 
	    ea key greaseString jsonWriteOn: aStream.
	    aStream nextPutAll: ': '.
	    ea value printJsonOn: aStream]
	separatedBy: [aStream nextPutAll: ', '].
	aStream nextPut: $}
    ]
]

