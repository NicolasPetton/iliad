"======================================================================
|
|   Iliad.ILFileProxy class definition
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



Object subclass: ILFileProxy [
    | filename contentType contents timestamps |
    <category: 'Iliad-Core-lib-HTTP'>
    <comment: nil>

    ILFileProxy class >> new [
	<category: 'instance creation'>
	^self basicNew
	    initialize;
	    yourself
    ]

    initialize [
	<category: 'initialize-release'>
	self setCreatedTimestamp
    ]

    setCreatedTimestamp [
	<category: 'initialize-release'>
	self timestampsAt: #created put: DateTime now
    ]

    contentType [
	<category: 'accessing'>
	^contentType
    ]

    contentType: anObject [
	<category: 'accessing'>
	contentType := anObject
    ]

    contents [
	<category: 'accessing'>
	^contents
    ]

    contents: anObject [
	<category: 'accessing'>
	contents := anObject
    ]

    createdTimestamp [
	<category: 'accessing'>
	^self timestampsAt: #created
    ]

    filename [
	<category: 'accessing'>
	^filename
    ]

    filename: anObject [
	<category: 'accessing'>
	filename := anObject
    ]

    timestamps [
	<category: 'accessing'>
	^timestamps ifNil: [timestamps := Dictionary new]
    ]

    timestampsAt: aSymbol [
	<category: 'accessing'>
	^self timestamps at: aSymbol ifAbsent: [nil]
    ]

    timestampsAt: aSymbol put: aTimestamp [
	<category: 'accessing'>
	^self timestamps at: aSymbol put: aTimestamp
    ]

    writeToFile [
	<category: 'writing'>
	| file |
	file := File name: self filename.
	(file writeStream)
	    nextPutAll: self contents;
	    close
    ]
]

