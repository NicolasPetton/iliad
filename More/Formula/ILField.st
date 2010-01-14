ILBuildable subclass: ILField [
    | conditions errors key labelContents commentContents value action |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    ILField class >> on: aSelector of: anObject [
	<category: 'instance creation'>
	^self new
	    on: aSelector
	    of: anObject;
	    yourself
    ]

    key [
	<category: 'accessing'>
	^key
    ]

    key: aSymbol [
	<category: 'accessing'>
	key := aSymbol
    ]

    label: aString [
	<category: 'accessing'>
	self labelContents: [:e | e text: aString]
    ]

    labelContents: aBlock [
	<category: 'accessing'>
	labelContents := aBlock
    ]

    labelContents [
	<category: 'accessing'>
	^labelContents
    ]

    comment: aString [
	<category: 'accessing'>
	self commentContents: [:e | e text: aString]
    ]

    commentContents: aBlock [
	<category: 'accessing'>
	commentContents := aBlock
    ]

    commentContents [
	<category: 'accessing'>
	^commentContents 
    ]

    value [
	<category: 'accessing'>
	^value
    ]

    value: anObject [
	<category: 'accessing'>
	value := anObject
    ]

    errors [
	<category: 'accessing'>
	^errors ifNil: [{}]
    ]

    conditions [
	<category: 'accessing'>
	^conditions ifNil: [conditions := OrderedCollection new]
    ]

    setAction: aBlock [
	<category: 'accessing'>
	action := aBlock
    ]

    addCondition: aCondition [
	<category: 'conditions'>
	self conditions add: aCondition
    ]

    addCondition: aBlock labelled: anotherBlock [
	<category: 'conditions'>
	self addCondition: (ILCondition new
	    conditionBlock: aBlock;
	    labelBlock: anotherBlock;
	    yourself)
    ]

    validate [
	<category: 'actions'>
	errors := OrderedCollection new.
	self conditions do: [:each |
	    (each validate: self value) ifFalse: [
		self errors add: (each labelFor: self value)]].
    ]

    commit [
	<category: 'actions'>
	action value: self value
    ]

    buildContents [
	<category: 'building'>
	^Iliad.ILXHTMLElement new 
	    build: self tableRowContents;
	    yourself
    ]

    tableRowContents [
	<category: 'building'>
	^[:tbody|
	    tbody tr build: [:tr |
		self isValid ifFalse: [
		    tr class: 'error'].
		tr td 
		    build: self labelContents.
		tr td 
		    build: self fieldContents].
	    tbody tr build: [:tr |
		tr td.
		self commentContents ifNotNil: [
		    tr td
			class: 'comment';
			build: self commentContents]].
	    tbody build: self errorsContents]
    ]

    fieldContents [
	<category: 'building'>
	self subclassResponsibility
    ]

    errorsContents [
	<category: 'building'>
	^[:tbody |
	    self errors notEmpty ifTrue: [
		tbody tr build: [:tr |
		    tr td.
		    tr td div 
			class: 'errors';
			build: [:div |
			    div text: self errors first]]]]
    ]

    isValid [
	<category: 'testing'>
	^self errors isEmpty
    ]

    on: aSelector of: anObject [
	<category: 'private'>
	key ifNil: [key := aSelector].
	labelContents ifNil: [self label: aSelector asString].
	value := anObject perform: aSelector.
	action := [:val | 
	    anObject perform: (aSelector, ':') asSymbol with: val]
    ]
]
