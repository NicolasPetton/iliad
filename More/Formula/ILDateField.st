ILField subclass: ILDateField [
    | selector |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	selector := ILDateSelector new;
	    selectedDate: (self value ifNil: [Date today]);
	    actionBlock: [:date | self value: date]
    ]

    date [
	<category: 'accessing'>
	^self selector selectedDate
    ]

    date: aDate [
	<category: 'accessing'>
	self selector selectedDate: aDate
    ]

    fieldContents [
	<category: 'building'>
	^selector
    ]
]
