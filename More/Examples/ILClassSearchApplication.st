ILApplication subclass: ILClassSearchApplication [
    | searchPart |

    <comment: nil>
    <category: 'Iliad-More-Examples'>

    ILClassSearchApplication class >> path [
	<category: 'accessing'>
	^'search'
    ]
    
    searchPart [
	<category: 'accessing'>
	^searchPart ifNil: [searchPart := ILSearchPart new]
    ]

    index [
	<category: 'controllers'>
	^[:e |
	    e build: self searchPart]
    ]

    updatePage: aPage [
	<category: 'building'>
	super updatePage: aPage.
	aPage head stylesheet href: '/stylesheets/iliad.css'
    ]
]
