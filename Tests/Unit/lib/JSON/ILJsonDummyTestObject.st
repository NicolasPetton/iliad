"======================================================================
|
|   Iliad.ILJsonDummyTestObject class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| From Displomacy written by Avi Bryant
| http://www.squeaksource.com/Diplomacy.
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



Object subclass: ILJsonDummyTestObject [
    | a b c |
    
    <category: 'Iliad-Core-lib-JSON'>
    <comment: nil>

    ILJsonDummyTestObject class >> constructFromJson: j [
	^(self new)
	    a: (j at: 'a');
	    b: (j at: 'b');
	    c: (j at: 'c');
	    yourself
    ]

    = other [
	<category: 'running'>
	^other class == self class 
	    and: [a = other a and: [b = other b and: [c = other c]]]
    ]

    a [
	"Answer the value of a"

	<category: 'accessing'>
	^a
    ]

    a: anObject [
	"Set the value of a"

	<category: 'accessing'>
	a := anObject
    ]

    b [
	"Answer the value of b"

	<category: 'accessing'>
	^b
    ]

    b: anObject [
	"Set the value of b"

	<category: 'accessing'>
	b := anObject
    ]

    c [
	"Answer the value of c"

	<category: 'accessing'>
	^c
    ]

    c: anObject [
	"Set the value of c"

	<category: 'accessing'>
	c := anObject
    ]
    
    printJsonOn: s [
	<category: 'Iliad-Core-lib-JSON-printing'>
	ILJson 
	    renderInstanceVariables: 
		{#a.
		#b.
		#c}
	    of: self
	    on: s
    ]
]

