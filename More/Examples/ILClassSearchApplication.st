ILApplication subclass: ILClassSearchApplication [
    | searchWidget |

    <comment: nil>
    <category: 'Iliad-More-Examples'>

    ILClassSearchApplication class >> path [
	<category: 'accessing'>
	^'search'
    ]
    
    searchWidget [
	<category: 'accessing'>
	^searchWidget ifNil: [searchWidget := ILClassSearchWidget new]
    ]

    index [
	<category: 'controllers'>
	^[:e |
	    e build: self searchWidget]
    ]

    updatePage: aPage [
	<category: 'building'>
	super updatePage: aPage.
	aPage head stylesheet href: '/stylesheets/iliad.css'
    ]
]
