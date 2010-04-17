"======================================================================
|
|   Iliad.ILAction class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
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



ILObject subclass: ILAction [
    | key block value stateRegistry |
    
    <category: 'Iliad-Core-Sessions'>
    <comment: nil>
    
    stateRegistry [
	<category: 'accessing'>
	^stateRegistry
    ]

    stateRegistry: aStateRegistry [
	<category: 'accessing'>
	stateRegistry := aStateRegistry
    ]

    block [
	<category: 'accessing'>
	^block
    ]

    block: aBlock [
	<category: 'accessing'>
	block := aBlock
    ]

    key [
	<category: 'accessing'>
	^key
    ]

    key: anId [
	<category: 'accessing'>
	key := anId
    ]

    value [
	<category: 'accessing'>
	^value
    ]

    value: anObject [
	<category: 'accessing'>
	value := anObject
    ]

    evaluate [
	<category: 'evaluating'>
	self block ifNil: [^nil].
	^self block valueWithPossibleArguments: (Array with: self value)
    ]

    respondOn: aResponse [
	<category: 'converting'>
	^self value respondOn: aResponse
    ]
]
