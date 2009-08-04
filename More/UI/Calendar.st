"======================================================================
|
|   Iliad.Calendar class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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


UIWidget subclass: Calendar [
    | month year actionBlock |

    <comment: nil>
    <category: 'Iliad-Core-UI'>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	self date: Date today.
	self actionBlock: [:val | self answer: val]
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e 
		build:self monthSelectionFormContents;
		build: self calendarTableContents]
    ]

    monthSelectionFormContents [
	<category: 'building'>
	^[:e || form select |
	    form := e form class: 'month_selection'; yourself.
	    select := form select.
	    self months do: [:each || option |
		option := select option.
		option 
		    text: each asString;
		    action: [self selectMonth: (Date indexOfMonth: each)].
		(Date indexOfMonth: each) = self month ifTrue: [
		    option selected]].
	    form input 
		maxLength: 4; 
		action: [:val | self selectYear: val];
		value: self year.
	    form button text: 'select']
    ]

    calendarTableContents [
	<category: 'building'>
	^[:e || table row date |
	    table := e table.
	    date := Date newDay: 1 monthIndex: self month year: self year.
	    table build: self daysOfWeekRowContents.
	    row := table tableRow.
	    date dayOfWeek - 1 timesRepeat: [row tableData].
	    date daysInMonth timesRepeat: [| selectedDate |
		selectedDate := date.
		date dayOfWeek - 1 \\ 7 = 0 ifTrue: [row := table tableRow].
		row tableData anchor
		    action: [self selectDate: selectedDate];
		    text: date dayOfMonth asString.
		date := date addDays: 1]]
    ]

    daysOfWeekRowContents [
	<category: 'building'>
	^[:e || head |
	    head := e tableHead.
	    self daysOfWeek do: [:each |
		head tableData text: each]]
    ]

    cssClass [
	<category: 'accessing'>
	^super cssClass, ' calendar'
    ]

    actionBlock [
	<category: 'accessing'>
	^actionBlock
    ]

    actionBlock: aBlock [
	<category: 'accessing'>
	actionBlock := aBlock
    ]

    month [
	<category: 'accessing'>
	^month
    ]

    month: anInteger [
	<category: 'accessing'>
	month := anInteger
    ]

    year [
	<category: 'accessing'>
	^year
    ]

    year: anInteger [
	<category: 'accessing'>
	year := [anInteger asNumber] on: Error do: [:error | 1970].
    ]

    date [
	<category: 'accessing'>
	^Date 
	    newDay: 1 
	    monthIndex: self month 
	    year: self year
    ]

    date: aDate [
	<category: 'accessing'>
	self month: aDate monthIndex.
	self year: aDate year.
    ]

    daysOfWeek [
	<category: 'accessing'>
	^(1 to: 7) collect: [:i |
	    (Date nameOfDay: i) first: 3]
    ]

    months [
	<category: 'accessing'>
	^(1 to: 12) collect: [:i | 
	    Date nameOfMonth: i]
    ]

    selectDate: aDate [
	<category: 'actions'>
	self actionBlock value: aDate
    ]

    selectMonth: anInteger [
	<category: 'actions'>
	self month: anInteger.
	self markDirty
    ]

    selectYear: anInteger [
	<category: 'actions'>
	self year: anInteger.
	self markDirty
    ]
]

