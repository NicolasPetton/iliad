ILDirectory subclass: ILDiskDirectory [
    | directory |

    <category: 'Iliad-Core-RequestHandlers'>
    <comment: nil>

    fileContentsFor: aString [
	<category: 'accessing'>
	| file |
	file := self fileNamed: (self adjustPath: aString).
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

    fileNamed: aFilename [
	"Try to find a file named <aFileName> in the directory"
	<category: 'private'>

	| file |
	aFilename isEmpty ifTrue: [^nil].
	file := self directory / aFilename.
	(file notNil and: [file exists]) ifTrue: [^file].
	^nil
    ]

    adjustPath: aFilename [
	<category: 'private'>
	^aFilename copyReplacingRegex: '^\/' with: ''
    ]
]
