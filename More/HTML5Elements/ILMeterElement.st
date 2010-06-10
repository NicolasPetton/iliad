"======================================================================
|
|   Iliad.ILMeterElement class definition
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



ILHTMLBuilderElement subclass: ILMeterElement [

    <category: 'Iliad-More-HTML5Elements'>
    <comment: 'The meter element represents a scalar gauge providing a
    measurement within  a known range, or a fractional value'>

    tag [
	<category: 'accessing'>
	^'meter'
    ]

    high: anInteger [
	"The point that marks the lower boundary of the high segment of the meter"

	<category: 'accessing-attributes'>
	self attributeAt: 'high' put: anInteger
    ]

    low: anInteger [
	"The point that marks the upper boundary of the low segment of the meter"

	<category: 'accessing-attributes'>
	self attributeAt: 'low' put: anInteger
    ]

    max: anInteger [
	"The upper bound of the range for the meter"	

	<category: 'accessing-attributes'>
	self attributeAt: 'max' put: anInteger
    ]

    min: anInteger [
	"The lower bound of the range for the meter"

	<category: 'accessing-attributes'>
	self attributeAt: 'max' put: anInteger
    ]

    optimum: anInteger [
	"The point that marks the optimum position for the meter"

	<category: 'accessing-attributes'>
	self attributeAt: 'optimum' put: anInteger
    ]

    value: anInteger [
	"The measured value shown by meter"

	<category: 'accessing-attributes'>
	self attributeAt: 'value' put: anInteger
    ]
]
