
TestCase subclass: ILFileHandlerTest [
    | fileHandler |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RequestHandlers'>

    setUp [
	<category: 'running'>
	fileHandler := ILFileHandler new
    ]

    testMimeType [
	<category: 'testing'>
	self 
	    assert: fileHandler class defaultMimeType = 'application/octet-stream'
    ]
]

