
TestCase subclass: ILRequestHandlerTest [
    | requestHandler response |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RequestHandlers'>

    setUp [
	requestHandler := ILRequestHandler new.
	response := ILResponse new
    ]

    testAddAllowHeaderTo [
	| methods headers |
	methods := 'OPTIONS,GET,HEAD,POST,DELETE,TRACE,PROPFIND,PROPPATCH,MKCOL,PUT,COPY,MOVE,LOCK,UNLOCK'.
	requestHandler addAllowHeaderTo: response.
	headers := response headers.
	self assert: ((Dictionary from: headers) at: 'Allow') = methods
    ]

    testAddCacheHeaderTo [
	| timeStamp headers |
	timeStamp := (Grease.GRPrinter rfc822WithTimeZone: 'GMT') print: (DateTime 
	    fromSeconds: DateTime now asSeconds + (24 * 3600 * 365)).
	requestHandler addCacheHeaderTo: response.
	headers := response headers.
	self assert: ((Dictionary from: headers) at: 'expires') = timeStamp
    ]

    testAddNoCacheHeaderTo [
	| timeStamp headers |
	timeStamp := (Grease.GRPrinter rfc822WithTimeZone: 'GMT') print: DateTime now.
	requestHandler addNoCacheHeaderTo: response.
	headers := response headers.
	self assert: ((Dictionary from: headers) at: 'expires') = timeStamp.
	self assert: ((Dictionary from: headers) at: 'Cache-Control') 
		    = 'no-store, no-cache, must-revalidate'
    ]
]

