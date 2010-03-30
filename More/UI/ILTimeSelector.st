"======================================================================
|
|   Iliad.ILTimeSelector class definition
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



ILUIWidget subclass: ILTimeSelector [
    | actionBlock selectedHours selectedMinutes showSeconds selectedSeconds |
    
    <comment: nil>
    <category: 'Iliad-Core-UI'>

    cssClass [
	<category: 'accessing'>
	^super cssClass, ' time_selector'
    ]

    actionBlock [
	<category: 'accessing'>
	^actionBlock
    ]

    actionBlock: aBlock [
	<category: 'accessing'>
	actionBlock := aBlock
    ]

    selectedHours [
	<category: 'accessing'>
	^selectedHours
    ]

    selectedHours: anInteger [
	<category: 'accessing'>
	selectedHours := anInteger
    ]

    selectedMinutes [
	<category: 'accessing'>
	^selectedMinutes
    ]

    selectedMinutes: anInteger [
	<category: 'accessing'>
	selectedMinutes := anInteger
    ]

    selectedSeconds [
	<category: 'accessing'>
	^selectedSeconds
    ]

    selectedSeconds: anInteger [
	<category: 'accessing'>
	selectedSeconds := anInteger
    ]

    selectedTime [
	<category: 'accessing'>
	^Time 
	    hour: self selectedHours
	    minute: self selectedMinutes
	    second: self selectedSeconds
    ]

    selectedTime: aTime [
	self selectedHours: aTime hour24.
	self selectedMinutes: aTime minute.
	self selectedSeconds: aTime second
    ]

    showSeconds [
	<category: 'accessing'>
	^showSeconds ifNil: [false]
    ]

    showSeconds: aBoolean [
	<category: 'accessing'>
	showSeconds := aBoolean
    ]

    contents [
	<category: 'building'>
	^[:e || div |
	    div := e div class: self cssClass.
	    self selectedTimeIsValid ifFalse: [
		div div
		    class: 'error';
		    text: 'Invalid time'].
	    div
		build: self hoursInputContents;
		text: ':';
		build: self minutesInputContents.
	    self showSeconds ifTrue: [
		div
		    text: ':';
		    build: self secondsInputContents].
	    div space.
	    div button
		text: 'Select';
		action: [self selectTime]]
    ]

    hoursInputContents [
	<category: 'building'>
	^[:e | 
	    (e input)
		size: 2;
		value: self selectedHours;
		action: [:val | self selectHours: val]]
    ]

    minutesInputContents [
	<category: 'building'>
	^[:e | 
	    (e input)
		size: 2;
		value: self selectedMinutes;
		action: [:val | self selectMinutes: val]]
    ]

    secondsInputContents [
	<category: 'building'>
	^
	[:e | 
	    (e input)
		size: 2;
		value: self selectedSeconds;
		action: [:val | self selectSeconds: val]]
    ]

    initialize [
	<category: 'initialization'>
	super initialize.
	actionBlock := [:val | self answer: val].
	selectedHours := Time now hour24.
	selectedMinutes := Time now minute.
	selectedSeconds := Time now second
    ]

    selectHours: aString [
	<category: 'actions'>
	self selectedHours: aString asInteger
    ]

    selectMinutes: aString [
	<category: 'actions'>
	self selectedMinutes: aString asInteger
    ]

    selectSeconds: aString [
	<category: 'actions'>
	self selectedSeconds: aString asInteger
    ]

    selectTime [
	<category: 'actions'>
	self selectedTimeIsValid ifFalse: [^self markDirty].
	self actionBlock value: self selectedTime
    ]

    selectedTimeIsValid [
	<category: 'testing'>
	^(0 <= self selectedHours and: [self selectedHours <= 24]) 
	    and: [0 <= self selectedMinutes and: [self selectedMinutes <= 60]]
	    and: [0 <= self selectedSeconds and: [self selectedSeconds <= 60]]
    ]
]

