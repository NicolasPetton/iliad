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

    buttons [
	<category: 'accessing'>
	^buttons ifNil: [self defaultButtons]
    ]

    defaultButtons [
	<category: 'defaults'>
	^{'save' -> [self save]}
    ]

    addField: aField [
	<category: 'adding'>
	^self fields add: aField
    ]

    inputOn: aSelector [
	<category: 'adding'>
	^self addField: (InputField on: aSelector of: model)
    ]

    textareaOn: aSelector [
	<category: 'adding'>
	^self addField: (TextareaField on: aSelector of: model)
    ]

    checkboxOn: aSelector [
	<category: 'adding'>
	^self addField: (CheckboxField on: aSelector of: model)
    ]

    passwordOn: aSelector [
	<category: 'adding'>
	^self addField: (PasswordField on: aSelector of: model)
    ]

    selectOn: aSelector [
	<category: 'adding'>
	^self addField: (SelectField on: aSelector of: model)
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
	    self commit]
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
