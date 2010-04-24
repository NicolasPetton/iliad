ILApplication subclass: ILApplicationMock2 [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Dispatching'>

    ILApplicationMock2 class [
	| path |

	path [
	    <category: 'accessing'>
	    ^path ifNil: ['']
	]

	path: aString [
	    <category: 'accessing'>
	    path := aString
	]
    ]
]

