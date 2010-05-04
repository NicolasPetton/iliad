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
			    ifTrue: [div span text: '<< ']
			    ifFalse: [
				div a
				    text: '<<';
				    action: [self selectPage: self currentPage - 1].
			    div space].
			self range do: [:each | 
			    self currentPage = each 
				ifTrue: [div span class: 'selected'; text: each greaseString]
				ifFalse: [
				    div a
					text: each greaseString;
					action: [self selectPage: each]].
			    div space].
		    self currentPage = totalPages 
			ifTrue: [div span text: '>>']
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

    range [
	<category: 'accessing'>
	^self rangeStart to: self rangeEnd
    ]

    rangeStart [
	<category: 'accessing'>
	^1 max: self currentPage - 5
    ]

    rangeEnd [
	<category: 'accessing'>
	^self totalPages min: self currentPage + 5
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

