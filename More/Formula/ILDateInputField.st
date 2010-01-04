ILField subclass: ILDateInputField [
    | month day year yearsInterval |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	self value: Date today
    ]

    yearsInterval [
	<category: 'accessing'>
	^yearsInterval ifNil: [
	    (Date today year - 20) to: (Date today year + 20)]
    ]

    yearsInterval: anInterval [
	<category: 'accessing'>
	yearsInterval := anInterval
    ]

    value: aDate [
	<category: 'accessing'>
	super value: aDate.
	self date: aDate
    ]

    date [
	<category: 'accessing'>
	^Date 
	    newDay: self day
	    month: self month
	    year: self year
    ]

    date: aDate [
	<category: 'accessing'>
	self month: aDate monthName asString.
	self day: aDate dayOfMonth.
	self year: aDate year
    ]

    month [
	<category: 'accessing'>
	^month
    ]

    month: aString [
	<category: 'accessing'>
	month := aString
    ]

    day [
	<category: 'accessing'>
	^day
    ]

    day: anInteger [
	<category: 'accessing'>
	day := anInteger
    ]

    year [
	<category: 'accessing'>
	^year
    ]

    year: anInteger [
	<category: 'accessing'>
	year := anInteger
    ]

    months [
	<category: 'accessing'>
	^(1 to: 12) collect: [:each | (Date nameOfMonth: each) asString]
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
			text: each;
			action: [self month: each];
			selected: (self month = each)]].
	    e select build: [:select |
		self days do: [:each |
		    select option
			text: each printString;
			action: [self day: each];
			selected: (self day = each)]].
	    e select build: [:select |
		self years do: [:each |
		    select option
			text: each printString;
			action: [self year: each];
			selected: (self year = each)]].
	    e input beHidden
		action: [:val | self value: self date]]
    ]
]
