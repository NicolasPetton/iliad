ILApplication subclass: ILApplicationMock1 [

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Buildables'>

    ILApplicationMock1 class [
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

