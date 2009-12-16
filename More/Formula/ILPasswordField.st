ILField subclass: ILPasswordField [

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e password
		value: (self value ifNil: ['']);
		action: [:val | self value: val]]
    ]
]
