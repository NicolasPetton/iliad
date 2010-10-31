"======================================================================
|
|   Iliad.ILState class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2010 
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


ILObject subclass: ILState [
    | key attributes |

    initialize [
	<category: 'initialization'>
	super initialize.
	key := self session nextId
    ]

    postCopy [
	<category: 'copying'>
	super postCopy.
	attributes := attributes copy
    ]

    = aState [
	<category: 'comparing'>
	^self species = aState species and: [
	    self key = aState key]
    ]

    hash [
	<category: 'comparing'>
	^self species hash bitXor: self key hash
    ]

    key [
	<category: 'accessing'>
	^key
    ]

    key: aString [
	<category: 'accessing'>
	key := aString
    ]

    newKey [
	<category: 'accessing'>
	key := self session nextId
    ]

    attributes [
	<category: 'accessing'>
	^attributes ifNil: [attributes := Dictionary new]
    ]

    at: aKey [
	<category: 'accessing attributes'>
	^self at: aKey ifAbsent: [nil]
    ]

    at: aKey ifAbsent: aBlock [
	<category: 'accessing attributes'>
	^self attributes at: aKey ifAbsent: aBlock
    ]

    at: aKey put: aValue [
	<category: 'accessing attributes'>
	^self attributes at: aKey put: aValue
    ]
        
]
