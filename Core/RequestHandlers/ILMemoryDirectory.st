ILDirectory subclass: ILMemoryDirectory [
    
    <category: 'Iliad-Core-RequestHandlers'>
    <comment: nil>

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
	| mainPart extension |
	mainPart := (aString copyUpToLast: $.)
	    reject: [:each | each isAlphaNumeric not].
	[mainPart first isDigit]
	    whileTrue: [mainPart := mainPart allButFirst].
	extension := (aString copyAfterLast: $.) asLowercase capitalized.
	^(mainPart , extension) asSymbol
    ]
]

String extend [
    
    capitalized [
	"Return a copy with the first letter capitalized"
	<category: '*Iliad-Core'>
	| cap |
	self isEmpty ifTrue: [^self copy].
	cap := self copy.
	cap at: 1 put: (cap at: 1) asUppercase.
	^cap
    ]
]
