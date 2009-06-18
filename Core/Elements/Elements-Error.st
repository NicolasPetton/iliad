Error subclass: AttributeError [
    
    <category: 'Iliad-Core-Elements'>
    <comment: nil>
]



Error subclass: AttributeNotUnderstood [
    | element attribute |
    
    <category: 'Iliad-Core-Elements'>
    <comment: nil>

    AttributeNotUnderstood class >> element: anElement attribute: aString [
	<category: 'instance creation'>
	^(self new)
	    element: anElement;
	    attribute: aString;
	    yourself
    ]

    attribute [
	<category: 'accessing'>
	^attribute
    ]

    attribute: anObject [
	<category: 'accessing'>
	attribute := anObject
    ]

    element [
	<category: 'accessing'>
	^element
    ]

    element: anElement [
	<category: 'accessing'>
	element := anElement
    ]

    defaultAction [
	<category: 'exceptionDescription'>
	
    ]

    isResumable [
	<category: 'exceptionDescription'>
	^true
    ]

    messageText [
	<category: 'printing'>
	^'Tag ''{1}'' does not understand attribute ''{2}''' format: 
		{self element tag.
		self attribute}
    ]
]



Error subclass: ElementError [
    
    <comment: nil>
    <category: 'Iliad-Core-Elements'>
]

