ILOptionField subclass: ILSelectField [
    | multiple |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    multiple [
	<category: 'accessing'>
	^multiple ifNil: [false]
    ]

    multiple: aBoolean [
	<category: 'accessing'>
	multiple := aBoolean
    ]

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e select build: [:select |
		self multiple ifTrue: [
		    select beMultiple].
		self options do: [:each |
		    select option 
			selected: self value = each;
			action: [self value: each];
			text: (self optionLabelBlock value: each)]]]
    ]
]
