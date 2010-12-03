ILWidget subclass: ILSearchPart [

    <comment: nil>
    <category: 'Iliad-More-Examples'>

    contents [
	<category: 'building'>
	^[:e | | results searchText |
	    e h1: 'Search Smalltalk classes'.
	    e br.
	    e form class: 'search_class';
		build: [:form |
		    form text: 'Search: '.
		    form input
			beSubmitOnEvent: 'keyup';
			action: [:val |
			    searchText := val.
			    results markDirty].
		    form build: (results := self widgetFor: [:w |
			(self search: searchText) do: [:each |
			   w div 
				class: 'results';
				text: each.
			   w br]])]]
    ]

    search: aString [
	<category: 'private'>
	^(aString isNil or: [aString isEmpty])
	    ifTrue: [#()]
	    ifFalse: [
		(Class allSubclasses 
		    select: [:each |
			each instanceClass name asString beginsWith: aString]) 
		    collect: [:each |
			each instanceClass name asString]]
    ]
]
