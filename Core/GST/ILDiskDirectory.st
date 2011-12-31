ILDirectory subclass: ILDiskDirectory [
    | directory |

    <category: 'Iliad-Core-GST'>
    <comment: 'An ILDiskDirectory allows files to be served by Iliad directly from directories of even archives like .star files.
    I shouldn''t be used in production.

    Usage example: 
    
    Iliad.ILFileHandler addDirectory: 
	(Iliad.ILDiskDirectory new 
	    directory: (PackageLoader packageAt: ''SomePackage'') directory / ''Public'';
    '>

    fileContentsFor: aString [
	<category: 'accessing'>
	| file stream |
	file := self fileNamed: (self adjustPath: aString).
	file isNil ifTrue: [^nil].
	stream := file readStream.
	^[stream contents] ensure: [stream close]
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
	self directory ifNil: [^nil]. 
	file := self directory / aFilename.
	(file notNil and: [file exists]) ifTrue: [^file].
	^nil
    ]

    adjustPath: aFilename [
	<category: 'private'>
	^aFilename copyReplacingRegex: '^\/' with: ''
    ]
]
