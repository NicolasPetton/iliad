"Contributed by Eli Green"


ILUIWidget subclass: ILPaginator [
    | currentPage totalPages action |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    cssClass [
	<category: 'accessing'>
	^super cssClass, ' paginator'
    ]

    contents [
	<category: 'building'>
	^[:e | 
	    e div 
		class: self cssClass;
		build: [:div |
		    self totalPages > 1 ifTrue: [
			self currentPage = 1 
			    ifTrue: [div text: '<< ']
			    ifFalse: [
				div a
				    text: '<<';
				    action: [self selectPage: self currentPage - 1].
			    div space].
			(1 to: self totalPages) do: [:each | 
			    self currentPage = each 
				ifTrue: [div text: each greaseString]
				ifFalse: [
				    div a
					text: each greaseString;
					action: [self selectPage: each]].
			    div space].
		    self currentPage = totalPages 
			ifTrue: [div text: '>>']
			ifFalse: [
			    div a
				text: '>>';
				action: [self selectPage: self currentPage + 1]]]]]
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

