"======================================================================
|
|   Iliad.ILAutocompleterInputField class definition
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



ILField subclass: ILAutocompleteInputField [
    | options fieldId |

    <comment: nil>
    <category: 'Iliad-More-Formula'>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	fieldId := ILId new
    ]

    options [
	<category: 'accessing'>
	^options ifNil: [#()]
    ]

    options: aCollection [
	<category: 'accessing'>
	options := aCollection
    ]

    completerScript [
	<category: 'building'>
	| str |
	str := WriteStream on: ''.
	str nextPutAll: '
	jQuery(''#', fieldId , ''').autocomplete('.
	str nextPut: $[.
	self options do: [:each | 
	    str nextPutAll: '"' , each ,'"']
	separatedBy: [str nextPut: $,].
	str nextPutAll: '])'.
	^str contents
    ]

    fieldContents [
	<category: 'building'>
	^[:e | 
	e input
	    id: fieldId;
	    value: (self value ifNil: ['']);
	    action: [:val | self value: val].
	e script: self completerScript]
    ]
]
