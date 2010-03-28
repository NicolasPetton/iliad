ILObject subclass: ILDirectory [
    
    <category: 'Iliad-Core-RequestHandlers'>
    <comment: nil>

    fileContentsFor: aFilename [
	<category: 'accessing'>
	self subclassResponsibility
    ]
]
