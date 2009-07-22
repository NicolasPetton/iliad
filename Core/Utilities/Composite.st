"======================================================================
|
|   Iliad.Composite class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2009 
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


IliadObject subclass: Composite [
    | tail next |
    
    <comment: nil>
    <category: 'Iliad-Core-Utilities'>

    add: aComposite [
	<category: 'adding'>
	| head |
	tail ifNil: [tail := aComposite].
	head := tail next ifNil: [tail].
	tail next: aComposite.
	tail := tail next.
	tail next: head.
	^aComposite
    ]

    allChildrenDo: aBlock [
	<category: 'iterating'>
	self childrenDo: [:each | 
	    aBlock value: each.
	    each allChildrenDo: aBlock]
    ]

    childrenDo: aBlock [
	<category: 'iterating'>
	| child |
	tail ifNil: [^self].
	child := tail next.
	[child == tail] whileFalse: [
	    aBlock value: child.
	    child := child next].
	aBlock value: tail
    ]

    next [
	<category: 'accessing'>
	^next
    ]

    next: aLinkedObject [
	<category: 'accessing'>
	next := aLinkedObject
    ]
]

