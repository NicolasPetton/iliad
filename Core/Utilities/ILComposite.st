"======================================================================
|
|   Iliad.ILComposite class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
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


ILObject subclass: ILComposite [
    | tail next |
    
    <comment: nil>
    <category: 'Iliad-Core-Utilities'>

    = anObject [
	<category: 'comparing'>
	^self species = anObject species and: [
	    self children = anObject children]
    ]

    hash [
	<category: 'comparing'>
	^self species hash bitXor: self children hash
    ]

    children [
	<category: 'accessing'>
	| children |
	children := OrderedCollection new.
	self childrenDo: [:each |
	    children add: each].
	^children
    ]

    next [
	<category: 'accessing'>
	^next
    ]

    next: aComposite [
	<category: 'accessing'>
	next := aComposite
    ]
    
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
	<category: 'enumerating'>
	self childrenDo: [:each | 
	    aBlock value: each.
	    each allChildrenDo: aBlock]
    ]

    childrenDo: aBlock [
	<category: 'enumerating'>
	| child |
	tail ifNil: [^self].
	child := tail next.
	[child == tail] whileFalse: [
	    aBlock value: child.
	    child := child next].
	aBlock value: tail
    ]
]

