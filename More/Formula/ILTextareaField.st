ILField subclass: ILTextareaField [
    | size |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    size [
	<category: 'accessing'>
	^size
    ]

    size: aPoint [
	<category: 'accessing'>
	size := aPoint
    ]

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e textarea build: [:textarea |
		self size ifNotNil: [
		    textarea 
			cols: self size x;
			rows: self size y].
		textarea 
		    text: (self value ifNil: ['']);
		    action: [:val | self value: val]]]
    ]
]
