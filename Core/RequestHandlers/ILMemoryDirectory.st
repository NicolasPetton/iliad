ILDirectory subclass: ILMemoryDirectory [
    
    <category: 'Iliad-Core-RequestHandlers'>
    <comment: nil>

    ILMemoryDirectory class [
	
	addAllFilesIn: aPathString [
	    <category: 'maintenance'>
	    "adds all files in the directory specified by aPathString to the current file library"
	    (Greease.GRPlatform current filesIn: aPathString) do: [:each | self addFileAt: each]
	]

	addFileAt: aPath [
	    <category: 'maintenance'>
	    "adds the file specified by aFilename to the current file library"
	    self 
		addFileAt: aPath
		contents: (Grease.GRPlatform current 
		   contentsOfFile: aPath
		   binary: (ILFileHandler isBinary: aPath))
	]

	addFileAt: aPath contents: aByteArrayOrString [
	    <category: 'private'>
	    self 
		addFileNamed: (Grease.GRPlatform current localNameOf: aPath)
		contents: aByteArrayOrString
	]

	addFileNamed: aFilename contents: aByteArrayOrString [
	    <category: 'private'>
	| selector |
	selector := self convertToSelector: aFilename.
	(ILFileHandler isBinary: aFilename)
	    ifTrue: [self compileBinary: aByteArrayOrString selector: selector]
	    ifFalse: [self compileText: aByteArrayOrString selector: selector]
	]

	compileText: aByteArrayOrString selector: aSymbol [
	    "Compiles aByteArrayOrString into a method named aSymbol that returns aByteArrayOrString as a string literal."
	    <category: 'private'>

	    Grease.GRPlatform current 
		compile: (Grease.GRPlatform current asMethodReturningString: aByteArrayOrString named: aSymbol)
		into: self
		classified: self methodCategory
	]

	compileBinary: aByteArrayOrString selector: aSymbol [
	    "Compiles aByteArrayOrString into a method named aSymbol that returns aByteArrayOrString as a string literal."
	    <category: 'private'>

	    Grease.GRPlatform current 
		compile: (Grease.GRPlatform current asMethodReturningByteArray: aByteArrayOrString named: aSymbol)
		into: self
		classified: 'files'
	]

	convertToSelector: aString [
	    <category: 'private'>
	    | mainPart extension |
	    mainPart := (aString copyUpToLast: $.)
		reject: [:each | each isAlphaNumeric not].
	    [mainPart first isDigit]
		whileTrue: [mainPart := mainPart allButFirst].
	    extension := (aString copyAfterLast: $.) asLowercase capitalized.
	    ^(mainPart , extension) asSymbol
	]
    ]

    fileContentsFor: aString [
	<category: 'accessing'>
	| fileSelector |
	fileSelector := self convertToSelector: (self adjustPath: aString).
	(self isFileSelector: fileSelector) ifFalse: [^nil].
	^(self perform: fileSelector)
    ]

    path [
	"answer the base path of the memory directory"

	<category: 'accessing'>
	^self subclassResponsibility
    ]

    fileSelectors [
	<category: 'accessing'>
	^self class selectors select: [:each |
	    self isFileSelector: each]
    ]

    isFileSelector: aSelector [
	"Only methods in 'files' protocol are allowed to be served as files"

	<category: 'testing'>
	^(self class whichCategoryIncludesSelector: aSelector) = 'files'
    ]

    adjustPath: aString [
	<category: 'private'>
	^aString copyReplacingRegex: '^\/', self path, '\/' with: ''
    ]

    convertToSelector: aString [
	<category: 'private'>
	^self class convertToSelector: aString
    ]

    removeFile: aFilename [
	<category: 'maintenence'>
	Grease.GRPlatform current 
		removeSelector: (self asSelector: aFilename)
		from: self class
    ]

    deployFiles [
	"Write to disk the files that the receiver use to serve as methods.
	The files are stored in a subfolder named like the classname of the receiver in a subfolder of Smalltalk image folder."

	<category: 'maintenence'>
	Grease.GRPlatform current ensureExistenceOfFolder: self path.
	self fileSelectors do: [:each | 
	    Grease.GRPlatform current 
		write: (self perform: each)
		toFile: (self asFilename: each)
		inFolder: self path]
    ]
]
