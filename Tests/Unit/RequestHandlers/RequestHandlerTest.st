TestCase subclass: RequestHandlerTest [
    | requestHandler response |
    
    <comment: nil>
    <category: 'Iliad-Tests-RequestHandlers'>

    setUp [
	requestHandler := RequestHandler new.
	response := Response new
    ]

    testAddAllowHeaderTo [
	| methods headers |
	methods := 'OPTIONS,GET,HEAD,POST,DELETE,TRACE,PROPFIND,PROPPATCH,MKCOL,PUT,COPY,MOVE,LOCK,UNLOCK'.
	requestHandler addAllowHeaderTo: response.
	headers := response headers.
	self assert: ((Dictionary newFrom: headers) at: 'Allow') = methods
    ]

    testAddCacheHeaderTo [
	| timeStamp headers |
	timeStamp := Support rfc1123StringFor: (TimeStamp 
			    fromSeconds: TimeStamp now asSeconds + (24 * 3600)).
	requestHandler addCacheHeaderTo: response.
	headers := response headers.
	self assert: ((Dictionary newFrom: headers) at: 'expires') = timeStamp
    ]

    testAddNoCacheHeaderTo [
	| timeStamp headers |
	timeStamp := Support rfc1123StringFor: TimeStamp now.
	requestHandler addNoCacheHeaderTo: response.
	headers := response headers.
	self assert: ((Dictionary newFrom: headers) at: 'expires') = timeStamp.
	self assert: ((Dictionary newFrom: headers) at: 'Cache-Control') 
		    = 'no-store, no-cache, must-revalidate'
    ]
]

