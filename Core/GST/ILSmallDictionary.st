"======================================================================
|
|   Iliad.ILSmallDictionary class definition
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


LookupTable subclass: ILSmallDictionary [
    
    <shape: #pointer>
    <category: 'Iliad-Core-GST'>
    <comment: nil>

    ILSmallDictionary class >> new [
	<category: 'instance creation'>
	^self new: 2
    ]

    ILSmallDictionary class >> new: anInteger [
	<category: 'instance creation'>
	^(self primNew: anInteger) initialize: anInteger
    ]

    capacity [
	<category: 'private'>
	^super primSize
    ]

    whileGrowingAt: key put: value [
	<category: 'private'>
	tally := tally + 1.
	self primAt: self size put: key.
	self valueAt: self size put: value
    ]

    incrementTally [
	<category: 'private'>
	tally := tally + 1.
	^(tally > self primSize)
	    ifTrue: [self grow];
	    yourself
    ]

    findIndex: anObject [
	"Tries to see if anObject exists as an indexed variable. As soon as nil
	 or anObject is found, the index of that slot is answered"

	<category: 'private'>
	| element |
	self beConsistent.
	1 to: self size
	    do: [:i | 
		element := self primAt: i.
		(element isNil or: [element = anObject]) ifTrue: [^i]].
	tally = self primSize ifTrue: [self grow].
	^self size + 1
    ]
]
