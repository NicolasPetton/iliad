ILField subclass: ILCheckboxField [

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e checkbox
		checked: self value ifNil: [false];
		action: [:boolean | self value: boolean]]
    ]
]
