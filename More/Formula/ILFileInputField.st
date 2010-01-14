ILField subclass: ILFileInputField [

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e file 
		value: (self value ifNil: ['']);
		action: [:val | self value: val]]
    ]
]
