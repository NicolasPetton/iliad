Widget subclass: TodoListGridWidget [
    | selectBlock |
    
    <comment: nil>
    <category: 'Iliad-More-Examples'>

    addNewItem [
	<category: 'actions'>
	| newItem |
	newItem := TodoListItem new.
	self lightbox: ((TodoListItemEditor new)
		item: newItem;
		yourself)
	    onAnswer: [:item | item ifNotNil: [self application model addItem: item]]
    ]

    editItem: anItem [
	<category: 'actions'>
	self lightbox: ((TodoListItemEditor new)
		    item: (ModelProxy on: anItem);
		    yourself)
	    onAnswer: [:proxy | proxy ifNotNil:  [proxy commit]]
    ]

    removeItem: anItem [
	<category: 'actions'>
	self application model removeItem: anItem.
	self markDirty
    ]

    setItem: anItem completed: aBoolean [
	<category: 'actions'>
	anItem completed: aBoolean.
	self markDirty
    ]

    contents [
	<category: 'building'>
	^[:e || table |
	    table := e table.
	    table build: self tableHeadContents.
	    (self items asSortedCollection: [:a :b | a deadline < b deadline]) 
		do: [:each | table build: (self rowContentsForItem: each)].
	    e div a
		action: [self addNewItem];
		text: 'new']
    ]

    rowContentsForItem: anItem [
	<category: 'building'>
	^[:e || row |
	    row := e tr.
	    (row td form checkbox)
		checked: anItem completed;
		beSubmitOnClick;
		action: [:val | self setItem: anItem completed: val].
	    row td text: anItem title.
	    row td text: anItem description.
	    row td text: anItem deadline asString.
	    row td a
		action: [self editItem: anItem];
		text: 'edit'.
	    row td a
		action: [self removeItem: anItem];
		text: 'remove']
    ]

    tableHeadContents [
	<category: 'building'>
	^[:e || head |
	    head := e thead.
	    head td text: ''.
	    head td text: 'Title'.
	    head td text: 'Description'.
	    head td text: 'Deadline']
    ]

    items [
	<category: 'accessing'>
	^self application model items select: self selectBlock
    ]

    selectBlock [
	<category: 'accessing'>
	^selectBlock ifNil: [selectBlock := [:each | each completed not]]
    ]

    selectBlock: aBlock [
	<category: 'accessing'>
	selectBlock := aBlock
    ]
]

