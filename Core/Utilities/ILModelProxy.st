"======================================================================
|
|   Iliad.ILModelProxy class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Some parts of this file reuse code from the Seaside framework written 
| by Avi Bryant, Julian Fitzell, Lukas Renggli, Michel Bany, Philippe
| Marschall and Seaside contributors http://www.seaside.st 
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



Object subclass: ILModelProxy [
    | cache model |
    
    <category: 'Iliad-Core-Utilities'>
    <comment: nil>

    ILModelProxy class >> on: anObject [
	<category: 'instance creation'>
	^self new setModel: anObject
    ]

    commit [
	<category: 'forwarding'>
	cache 
	    keysAndValuesDo: [:key :value | self performRealWrite: key with: value].
	cache := Dictionary new
    ]

    doesNotUnderstand: aMessage [
	<category: 'forwarding'>
	^aMessage selector isUnary 
	    ifTrue: [self performRead: aMessage selector]
	    ifFalse: 
		[(aMessage selector isKeyword and: [aMessage arguments size = 1]) 
		    ifTrue: [
			self performWrite: aMessage selector allButLast with: aMessage argument]
		    ifFalse: [super doesNotUnderstand: aMessage]]
    ]

    name [
	<category: 'forwarding'>
	^model name
    ]

    value [
	<category: 'forwarding'>
	^model value
    ]

    model [
	<category: 'accessing'>
	^model
    ]

    performRead: aSymbol [
	<category: 'private'>
	^cache at: aSymbol asSymbol ifAbsent: [model perform: aSymbol]
    ]

    performRealWrite: aSymbol with: anObject [
	<category: 'private'>
	model perform: (aSymbol copyWith: $:) asSymbol with: anObject
    ]

    performWrite: aSymbol with: anObject [
	<category: 'private'>
	cache at: aSymbol asSymbol put: anObject
    ]

    setModel: anObject [
	<category: 'initializing'>
	model := anObject.
	cache := Dictionary new
    ]
]


Symbol extend [

    isKeyword [
	<category: 'testing'>
	^self last = $:
    ]

    isUnary [
	<category: 'testing'>
	^self numArgs = 0
    ]
]
