"======================================================================
|
|   Iliad.SmallDictionary class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
|
| This file is part of the Iliad framework.
|
| Iliad.SmallDictionary is adapted from WASmalltalkDictionary from Seaside.
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



Object subclass: SmallDictionary [
    | size keys values |
    
    <category: 'Iliad-Core-Utilities'>
    <comment: 'I am an implementation of a dictionary. Compared to other dictionaries I am very efficient for small sizes, speed- and space-wise. I also remember the order in which elements are added, some of my users might depend on that. My implementation features some ideas from the RefactoringBrowser.'>

    SmallDictionary class >> new [
	<category: 'instance-creation'>
	^self new: 3
    ]

    SmallDictionary class >> new: anInteger [
	<category: 'instance-creation'>
	^self basicNew initialize: anInteger
    ]

    associations [
	"Answer a Collection containing the receiver's associations."

	<category: 'accessing'>
	| result |
	result := WriteStream on: (Array new: self size).
	self associationsDo: [:assoc | result nextPut: assoc].
	^result contents
    ]

    associationsDo: aBlock [
	<category: 'enumerating'>
	self keysAndValuesDo: [:key :value | aBlock value: key -> value]
    ]

    at: aKey [
	"Answer the value associated with aKey. Raise an exception, if no such key is defined."

	<category: 'accessing'>
	^self at: aKey ifAbsent: [self errorKeyNotFound]
    ]

    at: aKey ifAbsent: aBlock [
	"Answer the value associated with aKey. Evaluate aBlock, if no such key is defined."

	<category: 'accessing'>
	| index |
	index := self findIndexFor: aKey.
	^index = 0 ifFalse: [values at: index] ifTrue: [aBlock value]
    ]

    at: aKey ifAbsentPut: aBlock [
	"Answer the value associated with aKey. Evaluate aBlock, if no such key is defined and store the return value."

	<category: 'accessing'>
	| index |
	index := self findIndexFor: aKey.
	^index = 0 
	    ifFalse: [values at: index]
	    ifTrue: [self privateAt: aKey put: aBlock value]
    ]

    at: aKey ifPresent: aBlock [
	"Lookup aKey in the receiver. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, answer nil."

	<category: 'accessing'>
	| index |
	index := self findIndexFor: aKey.
	^index = 0 ifFalse: [aBlock value: (values at: index)]
    ]

    at: aKey put: aValue [
	"Set the value of aKey to be aValue."

	<category: 'accessing'>
	| index |
	index := self findIndexFor: aKey.
	^index = 0 
	    ifFalse: [values at: index put: aValue]
	    ifTrue: [self privateAt: aKey put: aValue]
    ]

    errorKeyNotFound [
	<category: 'private'>
	self error: 'Key not found'
    ]

    findIndexFor: aKey [
	<category: 'private'>
	1 to: size do: [:index | (keys at: index) = aKey ifTrue: [^index]].
	^0
    ]

    grow [
	<category: 'private'>
	| newKeys newValues |
	newKeys := Array new: 2 * size.
	newValues := Array new: 2 * size.
	1 to: size
	    do: 
		[:index | 
		newKeys at: index put: (keys at: index).
		newValues at: index put: (values at: index)].
	keys := newKeys.
	values := newValues
    ]

    includesKey: aKey [
	"Answer whether the receiver has a key equal to aKey."

	<category: 'testing'>
	^(self findIndexFor: aKey) ~= 0
    ]

    initialize: anInteger [
	<category: 'initialization'>
	size := 0.
	keys := Array new: anInteger.
	values := Array new: anInteger
    ]

    isEmpty [
	<category: 'testing'>
	^size = 0
    ]

    keys [
	<category: 'enumerating'>
	^keys copyFrom: 1 to: size
    ]

    keysAndValuesDo: aBlock [
	<category: 'enumerating'>
	1 to: size
	    do: [:index | aBlock value: (keys at: index) value: (values at: index)]
    ]

    keysDo: aBlock [
	<category: 'enumerating'>
	1 to: size do: [:each | aBlock value: (keys at: each)]
    ]

    postCopy [
	<category: 'copying'>
	super postCopy.
	keys := keys copy.
	values := values copy
    ]

    privateAt: aKey put: aValue [
	<category: 'private'>
	size = keys size ifTrue: [self grow].
	keys at: (size := size + 1) put: aKey.
	^values at: size put: aValue
    ]

    removeKey: aKey [
	"Remove aKey from the receiver, raise an exception if the element is missing."

	<category: 'accessing'>
	^self removeKey: aKey ifAbsent: [self errorKeyNotFound]
    ]

    removeKey: aKey ifAbsent: aBlock [
	"Remove aKey from the receiver, evaluate aBlock if the element is missing."

	<category: 'accessing'>
	| index value |
	index := self findIndexFor: aKey.
	index = 0 ifTrue: [^aBlock value].
	value := values at: index.
	index to: size - 1
	    do: 
		[:i | 
		keys at: i put: (keys at: i + 1).
		values at: i put: (values at: i + 1)].
	keys at: size put: nil.
	values at: size put: nil.
	size := size - 1.
	^value
    ]

    size [
	<category: 'accessing'>
	^size
    ]

    values [
	<category: 'enumerating'>
	^values copyFrom: 1 to: size
    ]

    valuesDo: aBlock [
	<category: 'enumerating'>
	1 to: size do: [:index | aBlock value: (values at: index)]
    ]
]
