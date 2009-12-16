ILBuildable subclass: ILField [
    | conditions errors key labelBlock commentBlock value action |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    Field class >> on: aSelector of: anObject [
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
	self labelBlock: [:e | e text: aString]
    ]

    labelBlock: aBlock [
	<category: 'accessing'>
	labelBlock := aBlock
    ]

    labelBlock [
	<category: 'accessing'>
	^labelBlock
    ]

    comment: aString [
	<category: 'accessing'>
	self commentBlock: [:e | e text: aString]
    ]

    commentBlock: aBlock [
	<category: 'accessing'>
	commentBlock := aBlock
    ]

    commentBlock [
	<category: 'accessing'>
	^commentBlock ifNil: [
	    [:e |]]
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
	^errors ifNil: [{}]
    ]

    conditions [
	<category: 'accessing'>
	^conditions ifNil: [conditions := OrderedCollection new]
    ]

    addCondition: aCondition [
	<category: 'conditions'>
	self conditions add: aCondition
    ]

    addCondition: aBlock labelled: anotherBlock [
	<category: 'conditions'>
	self addCondition: (Condition new
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
		    build: self labelBlock.
		tr td 
		    build: self fieldContents].
	    tbody build: self commentContents.
	    tbody build: self errorsContents]
    ]

    fieldContents [
	<category: 'building'>
	self subclassResponsibility
    ]

    commentContents [
	<category: 'building'>
	^[:tbody |
	    tbody tr build: [:tr |
		tr td.
		tr td 
		    class: 'comment';
		    build: self commentBlock]]
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
	labelBlock ifNil: [self label: aSelector asString].
	value := anObject perform: aSelector.
	action := [:val | 
	    anObject perform: (aSelector, ':') asSymbol with: val]
    ]
]
