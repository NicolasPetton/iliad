ILField subclass: ILFileInputField [

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    (self value isNil or: [self value isString])
		ifTrue: [
		    e build: self uploadContents]
		ifFalse: [
		    e build: self fileContents]]
	]

    uploadContents [
	<category: 'building'>
	^[:e |
	    e file action: [:val | self value: val].
	    e button text: 'upload']
    ]

    fileContents [
	<category: 'building'>
	^[:e |
	    e text: self value filename]
    ]


    isMultipart [
	<category: 'testing'>
	^true
    ]
]
