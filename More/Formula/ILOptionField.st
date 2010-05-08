"======================================================================
|
|   Iliad.ILOptionField class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
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



ILField subclass: ILOptionField [
    | options optionLabelBlock |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    optionLabelBlock [
	<category: 'accessing'>
	^optionLabelBlock ifNil: [self defaultOptionLabelBlock]
    ]

    optionLabelBlock: aBlock [
	<category: 'accessing'>
	optionLabelBlock := aBlock
    ]

    defaultOptionLabelBlock [
	<category: 'defaults'>
	^[:option | 
	    option isString
		ifTrue: [option]
		ifFalse: [option greaseString]]
    ]

    options [
	<category: 'accessing'>
	^options ifNil: [{}]
    ]

    options: aCollection [
	<category: 'accessing'>
	options := aCollection
    ]

    options: aCollection labels: aBlock [
	<category: 'accessing'>
	self options: aCollection.
	self optionLabelBlock: aBlock
    ]

    value [
	<category: 'accessing'>
	(super value isNil and: [self isMultiple]) ifTrue: [
	    ^OrderedCollection new].
	^super value
    ]

    add: anObject [
	<category: 'accessing'>
	(self value includes: anObject)
	    ifFalse: [self value add: anObject]
    ]

    remove: anObject [
	<category: 'accessing'>
	(self value includes: anObject)
	    ifTrue: [self value remove: anObject]
    ]

    isMultiple [
	<category: 'testing'>
	^true
    ]
]
