"======================================================================
|
|   Iliad.ILTimeInputFieldField class definition
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




ILField subclass: ILTimeInputField [
    | hours minutes seconds |

    <category: 'Iliad-More-Formula'>
    <comment: nil>
    
    initialize [
	<category: 'initialize-release'>
	super initialize.
	self value: Time now
    ]

    hours [
	<category: 'accessing'>
	^hours
    ]

    hours: anInteger [
	<category: 'accessing'>
	hours := anInteger
    ]

    minutes [
	<category: 'accessing'>
	^minutes
    ]

    minutes: anInteger [
	<category: 'accessing'>
	minutes := anInteger
    ]

    seconds [
	<category: 'accessing'>
	^seconds
    ]

    seconds: anInteger [
	<category: 'accessing'>
	seconds := anInteger
    ]

    time [
	<category: 'accessing'>
	^Time 
	    hour: self hours 
	    minute: self minutes 
	    second: self seconds
    ]

    time: aTime [
	<category: 'accessing'>
	self hours: aTime hours.
	self minutes: aTime minutes.
	self seconds: aTime seconds
    ]

    value: aTime [
	<category: 'accessing'>
	super value: aTime.
	self time: aTime
    ] 

    fieldContents [
	<category: 'building'>
	^[:e |
	    e select build: [:select |
		(1 to: 24) do: [:each |
		    select option 
			text: each printString;
			action: [self hours: each];
			selected: (self hours = each)]].
	    e select build: [:select |
		(1 to: 60) do: [:each |
		    select option
			text: each printString;
			action: [self minutes: each];
			selected: (self minutes = each)]].
	    e select build: [:select |
		(1 to: 60) do: [:each |
		    select option
			text: each printString;
			action: [self seconds: each];
			selected: (self seconds = each)]].
	    e input beHidden
		action: [:val | self value: self time]]
    ]

]
