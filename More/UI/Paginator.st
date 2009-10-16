"Contributed by Eli Green"


UIWidget subclass: Paginator [
    | currentPage totalPages action |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    contents [
	<category: 'building'>
	^[:e | 
	    self currentPage = 1 
		ifTrue: [e text: '<< ']
		ifFalse: [
		    e a
			text: '<<';
			action: [self selectPage: self currentPage - 1].
		e space].
	    1 to: self totalPages do: [:eachPageNumber | 
		self currentPage = eachPageNumber 
		    ifTrue: [e text: eachPageNumber printString]
		    ifFalse: [
			e a
			    text: eachPageNumber printString;
			    action: [self selectPage: eachPageNumber]].
		e space].
	(self currentPage = totalPages or: [totalPages = 0]) 
	    ifTrue: [e text: '>>']
	    ifFalse: [
		e a
		    text: '>>';
		    action: [self selectPage: self currentPage + 1]]]
    ]

    action [
	<category: 'accessing'>
	^action
    ]

    action: anObject [
	<category: 'accessing'>
	action := anObject
    ]

    currentPage [
	<category: 'accessing'>
	^currentPage
    ]

    currentPage: anObject [
	<category: 'accessing'>
	currentPage := anObject.
	self markDirty
    ]

    totalPages [
	<category: 'accessing'>
	^totalPages
    ]

    totalPages: anObject [
	<category: 'accessing'>
	totalPages := anObject.
	self markDirty
    ]

    selectPage: aPage [
	<category: 'actions'>
	self action value: aPage
    ]
]

