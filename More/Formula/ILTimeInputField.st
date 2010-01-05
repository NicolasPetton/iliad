ILField subclass: ILTimeInputField [
    | hours minutes seconds |

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
	    hours: self hours 
	    minutes: self minutes 
	    seconds: self seconds
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
