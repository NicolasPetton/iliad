ILWidget subclass: ILClassSearchWidget [
    | resultsWidget searchText selectedClass infoWidget |

    <comment: nil>
    <category: 'Iliad-More-Examples'>

    searchText [
	<category: 'accessing'>
	^searchText ifNil: [searchText := '']
    ]

    searchText: aString [
	<category: 'accessing'>
	searchText := aString
    ]

    selectedClass [ 
	<category: 'accessing'>
	^selectedClass
    ]

    selectedClass: aClass [ 
	<category: 'accessing'>
	selectedClass := aClass
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e h1: 'Search Smalltalk classes'.
	    e br.
	    e form class: 'search_class';
		build: [:form |
		    form text: 'Search: '.
		    form input
			beSubmitOnEvent: 'keyup';
			action: [:val | 
			    self searchText: val.
			    self resultsWidget markDirty].
		    form build: self resultsWidget].
	    e build: self infoWidget]
    ]

    resultsWidget [
	<category: 'accessing'>
	^resultsWidget ifNil: [resultsWidget := self widgetFor: [:widget |
	    (self search: self searchText) do: [:each |
		widget a
		    class: 'results';
		    onClickDo: [ 
			self selectedClass: each.
			self infoWidget markDirty ];
		    text: each displayString.
		widget br]]]
    ]

    infoWidget [ 
	<category: 'accessing'>
	^infoWidget ifNil: [ infoWidget := self widgetFor: [ :widget |
	    widget style: 'float:left; text-align:left; width:60%; margin-left:5em;'.
	    self selectedClass ifNotNil: [ :aClass | | ul|
		widget h2 text: aClass displayString.
		self renderSuperclassOf: aClass on: widget div.
		self renderSubclassesOf: aClass on: widget div.
		widget p text: aClass comment.
		ul := widget ul.
		( self sortedMessagesForClass: aClass) 
		    do: [ :each | ul li text: each asString ]
	    ]
	]]
    ]

    renderSubclassesOf: aClass on: aContainer [
	<category: 'private'>
	aContainer text: 'subclass(es): '.
	aClass allSubclasses
	    do: [ :each |
		aContainer a 
		    onClickDo: [ self selectedClass: each. self infoWidget markDirty ];
		    text: each displayString ]
	    separatedBy: [ aContainer text: ', ' ].
    ]

    renderSuperclassOf: aClass on: aContainer [
	<category: 'private'>
	aContainer text: 'superclass: '.
	aClass superclass 
	    ifNil: [ aContainer text: 'nil' ]
	    ifNotNil: [:supa |
		aContainer a 
		    onClickDo: [ self selectedClass: supa. self infoWidget markDirty ];
		    text: supa displayString].
    ]

    sortedMessagesForClass: aClass [ 
	<category: 'private'>
	^aClass methodDictionary keys asSortedCollection
    ]

    search: aString [
	<category: 'private'>
	^(aString isNil or: [aString isEmpty])
	    ifTrue: [#()]
	    ifFalse: [
		(Class allSubclasses 
		    select: [:each |
			each instanceClass displayString beginsWith: aString])
		    collect: [ :each | each instanceClass ]]
    ]
]
