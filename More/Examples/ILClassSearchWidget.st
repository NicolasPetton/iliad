ILWidget subclass: ILClassSearchWidget [
    | resultsWidget searchText selectedClass infoWidget selectedMethod codeWidget |

    <comment: nil>
    <category: 'Iliad-More-Examples'>

    searchText [
	<category: 'accessing'>
	^searchText ifNil: [searchText := '']
    ]

    searchText: aString [
	<category: 'accessing'>
	searchText := aString.
	self resultsWidget markDirty
    ]

    selectedClass [ 
	<category: 'accessing'>
	^selectedClass
    ]

    selectedClass: aClass [ 
	<category: 'accessing'>
	selectedClass := aClass.
	self infoWidget markDirty.
	self selectedMethod: nil
    ]

    selectedMethod [ 
	<category: 'accessing'>
	^selectedMethod
    ]

    selectedMethod: aCompiledMethod [ 
	<category: 'accessing'>
	selectedMethod := aCompiledMethod.
	self codeWidget markDirty
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
			action: [:val | self searchText: val].
		    form build: self resultsWidget].
	    e build: self infoWidget.
	    e build: self codeWidget]
    ]

    resultsWidget [
	<category: 'accessing'>
	^resultsWidget ifNil: [resultsWidget := self widgetFor: [:widget |
	    (self search: self searchText) do: [:each |
		widget a
		    class: 'results';
		    onClickDo: [ self selectedClass: each ];
		    text: each displayString.
		widget br]]]
    ]

    codeWidget [ 
	<category: 'accessing'>
	^codeWidget ifNil: [ codeWidget := self widgetFor: [ :widget |
	    widget style: 'float:left; text-align:left; width:40%; margin-left:5em;'.
	    self selectedMethod ifNotNil: [ :aCompiledMethod | 
		widget pre text: (aCompiledMethod methodClass decompile: aCompiledMethod selector) ]]]
    ]

    infoWidget [ 
	<category: 'accessing'>
	^infoWidget ifNil: [ infoWidget := self widgetFor: [ :widget |
	    widget style: 'float:left; text-align:left; width:40%; margin-left:5em;'.
	    self selectedClass ifNotNil: [ :aClass |
		widget h2 text: aClass displayString.
		self renderSuperclassOf: aClass on: widget div.
		self renderSubclassesOf: aClass on: widget div.
		widget p text: aClass comment.
		widget h3: 'Instance Methods'.
		self renderInstanceMethodsOf: aClass on: widget ul.
		widget h3: 'Class Methods'.
		self renderInstanceMethodsOf: aClass class on: widget ul ]]]
    ]

    renderInstanceMethodsOf: aClass on: aListContainer [ 
	<category: 'private'>
	( self sortedMethodsForClass: aClass) 
	    do: [ :each |
		aListContainer li 
		    onClickDo: [ self selectedMethod: each ];
		    text: each selector asString;
		    text: ' (';
		    text: each methodCategory;
		    text: ')' ]
    ]

    renderSubclassesOf: aClass on: aContainer [
	<category: 'private'>
	aContainer text: 'subclass(es): '.
	( aClass subclasses asSortedCollection: [ :a :b | a displayString <= b displayString ] )
	    do: [ :each |
		aContainer a 
		    onClickDo: [ self selectedClass: each ];
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
		    onClickDo: [ self selectedClass: supa ];
		    text: supa displayString].
    ]

    sortedMethodsForClass: aClass [ 
	<category: 'private'>
	^(aClass methodDictionary
	    ifNil: [ OrderedCollection new ]
	    ifNotNil: [ :dict | dict keys asSortedCollection ]) collect: [ :message |
		aClass compiledMethodAt: message ]
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
