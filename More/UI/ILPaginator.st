"Contributed by Eli Green"


ILUIWidget subclass: ILPaginator [
    | currentPage totalPages action |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    contents [
	<category: 'building'>
	^[:e | 
	    self totalPages > 1 ifTrue: [
		self currentPage = 1 
		    ifTrue: [e text: '<< ']
		    ifFalse: [
			e a
			    text: '<<';
			    action: [self selectPage: self currentPage - 1].
		    e space].
		(1 to: self totalPages) do: [:each | 
		    self currentPage = each 
			ifTrue: [e text: each greaseString]
			ifFalse: [
			    e a
				text: each greaseString;
				action: [self selectPage: each]].
		    e space].
	    self currentPage = totalPages 
		ifTrue: [e text: '>>']
		ifFalse: [
		    e a
			text: '>>';
			action: [self selectPage: self currentPage + 1]]]]
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

    totalPages: anInteger [
	<category: 'accessing'>
	totalPages := anInteger.
	self markDirty
    ]

    selectPage: anInteger [
	<category: 'actions'>
	self action value: anInteger
    ]
]

