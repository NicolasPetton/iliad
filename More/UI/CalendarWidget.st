"======================================================================
|
|   Iliad.CalendarWidget class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from the Seaside WAMiniCalendar. Seaside is written
| by Avi Bryant, Julian Fitzell, Lukas Renggli, Michel Bany, Philippe
| Marschall and Seaside contributors http://www.seaside.st 
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


Widget subclass: CalendarWidget [
    | month date |
    
    <comment: nil>
    <category: 'Iliad-Core-Widgets'>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	date := Date today.
	month := date month
    ]

    date [
	<category: 'accessing'>
	^date
    ]

    date: aDate [
	<category: 'accessing'>
	date := aDate
    ]

    daysOfWeek [
	<category: 'accessing'>
	^#('Sun' 'Mon' 'Tue' 'Wed' 'Thu' 'Fri' 'Sat')
    ]

    month [
	<category: 'accessing'>
	^month
    ]

    month: aMonth [
	<category: 'accessing'>
	month := aMonth
    ]

    months [
	<category: 'accessing'>
	^(1 to: 12) collect: [:i | Date nameOfMonth: i]
    ]

    year [
	<category: 'accessing'>
	^self date year
    ]

    year: anInteger [
	<category: 'accessing'>
	| year |
	year := [anInteger asNumber] on: Error do: [:e | 1900].
	month := Month month: self month monthIndex year: year
    ]

    selectDate: aDate [
	<category: 'actions'>
	self answer: aDate
    ]

    selectMonth: aString [
	<category: 'actions'>
	self month: (Month month: aString year: self year).
	self markDirty
    ]

    selectYear: anInteger [
	<category: 'actions'>
	self year: anInteger.
	self markDirty
    ]

    calendarTableContents [
	<category: 'building'>
	^[:e || table |
	    table := e table.
	    table build: self daysOfWeekRowContents.
	    self month weeksDo: [:each | 
		table build: (self rowContentsForWeek: each)]]
    ]

    cellContentsForDate: aDate [
	<category: 'building'>
	^[:e || data |
	    data := e tableData.
	    aDate month = self month ifTrue: [
		data anchor
		    action: [self selectDate: aDate];
		    text: aDate dayOfMonth asString]]
    ]

    contents [
	<category: 'building'>
	^[:e || div |
	    div := e div class: 'calendar'.
	    div build: self monthSelectionFormContents.
	    div build: self calendarTableContents]
    ]

    daysOfWeekRowContents [
	<category: 'building'>
	^[:e || head |
	    head := e tableHead.
	    self daysOfWeek do: [:each | head tableData text: each]]
    ]

    monthSelectionFormContents [
	<category: 'building'>
	^[:e || form select |
	    form := e form class: 'month_selection'; yourself.
	select := form select.
	self months do: 
	    [:each || option |
	    option := select option.
	    option 
		text: each asString;
		action: [self selectMonth: each asString].
	    each = self month ifTrue: [option selected]].
	(form input)
	    maxLength: 4;
	    action: [:val | self selectYear: val];
	    value: self year.
	form button text: 'select']
    ]

    rowContentsForWeek: aWeek [
	<category: 'building'>
	^[:e | | row |
	    row := e tableRow.
	    aWeek datesDo: [:each | 
		row build: (self cellContentsForDate: each)]]
    ]
]

