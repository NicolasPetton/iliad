ILWidget subclass: ILFormula [
    | model fields buttons |
	
    <category: 'Iliad-More-Formula'>
    <comment: nil>

    ILFormula class >> on: anObject [
	<category: 'instance creation'>
	^self new
	    setModel: anObject;
	    yourself
    ]

    fields [
	<category: 'accessing'>
	^fields ifNil: [fields := OrderedCollection new]
    ]

    setFields: aCollection [
	<category: 'accessing'>
	fields := aCollection
    ]

    buttons [
	<category: 'accessing'>
	^buttons ifNil: [self defaultButtons]
    ]

    defaultButtons [
	<category: 'defaults'>
	^{'Save' -> [self save]. 'Cancel' -> [self cancel]}
    ]

    addField: aField [
	<category: 'adding'>
	^self fields add: aField
    ]

    inputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILInputField on: aSelector of: model)
    ]

    textareaOn: aSelector [
	<category: 'adding'>
	^self addField: (ILTextareaField on: aSelector of: model)
    ]

    checkboxOn: aSelector [
	<category: 'adding'>
	^self addField: (ILCheckboxField on: aSelector of: model)
    ]

    passwordOn: aSelector [
	<category: 'adding'>
	^self addField: (ILPasswordField on: aSelector of: model)
    ]

    dateInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILDateInputField on: aSelector of: model)
    ]

    selectOn: aSelector [
	<category: 'adding'>
	^self addField: (ILSelectField on: aSelector of: model)
    ]

    autocompleteInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILAutocompleteInputField on: aSelector of: model)
    ]

    do: aBlock [
	<category: 'enumerating'>
	^self fields do: aBlock
    
    ]

    collect: aBlock [
	<category: 'enumerating'>
	^self copy
	    setFields: (self fields collect: aBlock);
	    yourself
    ]

    select: aBlock [
	<category: 'enumerating'>
	^self copy
	    setFields: (self fields select: aBlock);
	    yourself
    ]

    reject: aBlock [
	<category: 'enumerating'>
	^self copy
	    setFields: (self fields reject: aBlock);
	    yourself
    
    ]

    scripts [
	<category: 'building'>
	^{'/javascripts/jquery.autocomplete.js'}
    ]

    styles [
	<category: 'building'>
	^{'/stylesheets/jquery.autocomplete.css'}
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e form build: [:form |
		form table tbody build: self tableContents.
		form build: self buttonsContents]]
    ]

    tableContents [
	<category: 'building'>
	^[:tbody |
	    self fields do: [:each |
		tbody build: each]]
    ]

    buttonsContents [
	<category: 'building'>
	^[:form |
	    self buttons do: [:each |
		form button
		    text: each key;
		    action: each value]]
    ]

    save [
	<category: 'actions'>
	self 
	    validate;
	    markDirty.
	self isValid ifTrue: [
	    self commit; answer: model]
    ]

    cancel [
	<category: 'actions'>
	self answer: nil
    ]

    commit [
	<category: 'actions'>
	self fields do: [:each |
	    each commit]
    ]

    validate [
	<category: 'actions'>
	self fields do: [:each | each validate]
    ]

    isValid [
	<category: 'testing'>
	self fields do: [:each |
	    each isValid ifFalse: [^false]].
	^true
    ]

    setModel: anObject [
	<category: 'private'>
	model := anObject
    ]
]
