"======================================================================
|
|   Iliad.ILDateInputField class definition
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




ILField subclass: ILDateInputField [
    |  yearsInterval |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    yearsInterval [
	<category: 'accessing'>
	^yearsInterval ifNil: [
	    (Date today year - 20) to: (Date today year + 20)]
    ]

    yearsInterval: anInterval [
	<category: 'accessing'>
	yearsInterval := anInterval
    ]

    value [
	<category: 'accessing'>
	^super value ifNil: [Date today]
    ]

    month [
	<category: 'accessing'>
	^self value monthIndex
    ]

    month: anInteger [
	<category: 'accessing'>
	self value: (Date 
	    newDay: self day 
	    monthIndex: anInteger
	    year: self year)
    ]

    day [
	<category: 'accessing'>
	^self value day
    ]

    day: anInteger [
	<category: 'accessing'>
	self value: (Date
	    newDay: anInteger
	    monthIndex: self month
	    year: self year)
    ]

    year [
	<category: 'accessing'>
	^self value year
    ]

    year: anInteger [
	<category: 'accessing'>
	self value: (Date
	    newDay: self day
	    monthIndex: self month
	    year: anInteger)
    ]

    months [
	<category: 'accessing'>
	^1 to: 12
    ]

    days [
	<category: 'accessing'>
	^1 to: 31
    ]

    years [
	<category: 'accessing'>
	^self yearsInterval
    ]

    fieldContents [
	<category: 'building'>
	^[:e |
	    e select build: [:select |
		self months do: [:each |
		    select option 
			text: (Date nameOfMonth: each) greaseString;
			action: [self month: each];
			selected: (self month = each)]].
	    e select build: [:select |
		self days do: [:each |
		    select option
			text: each greaseString;
			action: [self day: each];
			selected: (self day = each)]].
	    e select build: [:select |
		self years do: [:each |
		    select option
			text: each greaseString;
			action: [self year: each];
			selected: (self year = each)]]]
    ]
]
