ILWidget subclass: ILClassSearchWidget [
    | resultsWidget searchText |

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
			    self results markDirty].
		    form build: self resultsWidget]]
    ]

    resultsWidget [
	<category: 'accessing'>
	^resultsWidget ifNil: [resultsWidget := self widgetFor: [:widget |
	    (self search: self searchText) do: [:each |
		widget div
		    class: 'results';
		    text: each.
		widget br]]]
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
