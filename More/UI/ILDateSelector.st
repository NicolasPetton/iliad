"======================================================================
|
|   Iliad.ILDateSelector class definition
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


ILUIWidget subclass: ILDateSelector [
    | actionBlock selectedMonth selectedDay selectedYear |
    
    <comment: nil>
    <category: 'Iliad-Core-UI'>

    cssClass [
	<category: 'accessing'>
	^super cssClass, ' date_selector'
    ]

    actionBlock [
	<category: 'accessing'>
	^actionBlock
    ]

    actionBlock: aBlock [
	<category: 'accessing'>
	actionBlock := aBlock
    ]

    months [
	<category: 'accessing'>
	^(1 to: 12) collect: [:i | Date nameOfMonth: i]
    ]

    selectedDate [
	<category: 'accessing'>
	^Date 
	    newDay: self selectedDay
	    month: self selectedMonth
	    year: self selectedYear
    ]

    selectedDate: aDate [
	<category: 'accessing'>
	self selectedMonth: aDate monthName asString.
	self selectedDay: aDate dayOfMonth.
	self selectedYear: aDate year
    ]

    selectedDay [
	<category: 'accessing'>
	^selectedDay
    ]

    selectedDay: anInteger [
	<category: 'accessing'>
	selectedDay := anInteger
    ]

    selectedMonth [
	<category: 'accessing'>
	^selectedMonth
    ]

    selectedMonth: aString [
	<category: 'accessing'>
	selectedMonth := aString
    ]

    selectedYear [
	<category: 'accessing'>
	^selectedYear
    ]

    selectedYear: anInteger [
	<category: 'accessing'>
	selectedYear := anInteger
    ]

    contents [
	<category: 'building'>
	^[:e || div |
	    div := e div class: self cssClass.
	    self selectedDateIsValid 
		ifFalse: [
		    div div
			class: 'error';
			text: 'Invalid date'].
	    div
		build: self monthSelectionContents;
		build: self dayInputContents;
		build: self yearInputContents;
		space.
	    (div button)
		text: 'Select';
		action: [self selectDate]]
    ]

    dayInputContents [
	<category: 'building'>
	^[:e | 
	    (e input)
		size: 2;
		value: self selectedDay;
		action: [:val | self selectDay: val]]
    ]

    monthSelectionContents [
	<category: 'building'>
	^[:e | 
	    | select |
	    select := e select.
	    self months do: 
		[:each | 
		| option |
			option := (select option)
			action: [self selectMonth: each];
			text: each]]
    ]

    yearInputContents [
	<category: 'building'>
	^[:e | 
	    (e input)
		size: 4;
		value: self selectedYear;
		action: [:val | self selectYear: val]]
    ]

    initialize [
	<category: 'initialize-release'>
	super initialize.
	actionBlock := [:val | self answer: val].
	selectedMonth := Date today monthName asString.
	selectedDay := Date today dayOfMonth.
	selectedYear := Date today year
    ]

    selectDate [
	<category: 'actions'>
	self selectedDateIsValid ifFalse: [^self markDirty].
	self actionBlock value: self selectedDate
    ]

    selectDay: aString [
	<category: 'actions'>
	self selectedDay: aString asInteger
    ]

    selectMonth: aString [
	<category: 'actions'>
	self selectedMonth: aString
    ]

    selectYear: aString [
	<category: 'actions'>
	self selectedYear: aString asInteger
    ]

    selectedDateIsValid [
	<category: 'testing'>
	[self selectedDate] on: Error do: [:err | ^false].
	^true
    ]
]

