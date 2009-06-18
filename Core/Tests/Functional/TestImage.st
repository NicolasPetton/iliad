Widget subclass: TestImage [
    
    <comment: nil>
    <category: 'Iliad-Tests-Functional'>

    TestImage class >> path [
	^'image'
    ]

    contents [
	^[:e | 
	    e image 
		source: '/files/reeb-logo.png' 
		alternativeText: 'logo'.
	    e break.
	    e image 
		source: 'http://planet.smalltalk.org/images/balloon_small.gif'
		alternativeText: 'smalltalk']
    ]
]

