ILDirectory subclass: ILDiskDirectory [
    | directory |

    <category: 'Iliad-Core-RequestHandlers'>
    <comment: nil>

    fileContentsFor: aString [
	<category: 'accessing'>
	| file |
	file := self fullPathOf: (self adjustPath: aString).
	^file isNil 
	    ifTrue: [nil]
	    ifFalse: [file readStream contents]
    ]

    directory [
	<category: 'accessing'>
	^directory
    ]

    directory: aDirectory [
	<category: 'accessing'>
	directory := aDirectory
    ]

    fullPathOf: aFileName [
	"Try to find a file with <aFileName> in the directory"
	<category: 'private'>

	| file |
	aFileName isEmpty ifTrue: [^nil].
	file := self directory / aFileName.
	(file notNil and: [file exists]) ifTrue: [^file].
	^nil
    ]

    adjustPath: aFileName [
	<category: 'private'>
	^aFileName copyReplacingRegex: '^\/' with: ''
    ]
]
