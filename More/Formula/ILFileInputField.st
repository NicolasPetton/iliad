ILField subclass: ILFileInputField [

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e file action: [:val | self value: val].
	    e button text: 'upload']
    ]


    isMultipart [
	<category: 'testing'>
	^true
    ]
]
