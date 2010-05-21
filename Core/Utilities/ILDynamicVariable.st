"======================================================================
|
|   Iliad.ILDynamicVariable class definition
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



Object subclass: ILDynamicVariable [
    <category: 'Iliad-Core-Utilities'>
    <comment: nil>

    ILDynamicVariable class [
	| processVariable |

	defaultValue [
	    <category: 'defaults'>
	    ^nil
	]

	use: anObject during: aBlock [
	    <category: 'evaluating'>
	    ^self processVariable use: anObject during: aBlock
	]

	value [
	    <category: 'evaluating'>
	    ^self processVariable value
	]
	
	processVariable [ 
	    ^processVariable ifNil: [ 
		processVariable := ProcessEnvironment uniqueInstance associationAt: self]
	]
    ]
]

ProcessVariable extend [
    use: anObject during: aBlock [
	| oldValue |
	oldValue := self value.
	self value: anObject.
	^aBlock ensure: [self value: oldValue]
    ]
]
