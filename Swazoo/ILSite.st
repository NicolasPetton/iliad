Swazoo.SwazooSite subclass: ILSite [
    | codec |    
    <comment: nil>
    <category: 'Iliad-Swazoo'>

    ILSite class >> default [
	<category: 'defaults'>
	self ensureRegistered.
	^self named: self defaultName
    ]

    ILSite class >> defaultHost [
	<category: 'defaults'>
	^'*'
    ]

    ILSite class >> defaultIp [
	<category: 'defaults'>
	^'*'
    ]

    ILSite class >> defaultName [
	<category: 'defaults'>
	^'IliadSite'
    ]

    ILSite class >> defaultPort [
	<category: 'defaults'>
	^8080
    ]

    ILSite class >> ensureRegistered [
	<category: 'defaults'>
	(self named: self defaultName) 
	    ifNil: [self newDefaultOn: self defaultPort]
    ]

    ILSite class >> new [
	<category: 'instance creation'>
	^self basicNew
    ]

    ILSite class >> newDefaultOn: aPort [
	<category: 'instance creation'>
	^(self newNamed: self defaultName) 
	    host: self defaultHost
	    ip: self defaultIp
	    port: aPort
    ]

    codec [
	<category: 'accesing'>
	^codec ifNil: [codec := self defaultCodec]
    ]

    codec: aCodec [
	<category: 'accesing'>
	codec := aCodec
    ]

    defaultCodec [
	<category: 'defaults'>
	^Grease.GRNullCodec new
    ]

    answerTo: aRequest [
	<category: 'serving'>
	[ILDispatcher current 
	    dispatch: (self convertRequest: aRequest)]
		on: ILResponseNotification
		do: [:n | 
		    ^self convertResponse: n response]
    ]

    internalErrorResponseFor: anError [
	<category: 'private'>
	^Swazoo.HTTPResponse internalServerError
	    entity: '<h1>Internal error</h1>'
	    yourself
    ]

    convertHeader: aSwazooRequest [
	<category: 'private-serving'>
	| swazooFields fields |
	swazooFields := aSwazooRequest headers fields.
	fields := Dictionary new: swazooFields size.
	swazooFields keysAndValuesDo: [:key :field || value |
	    value := String streamContents: [:stream | field valuesAsStringOn: stream].
	    fields at: key asLowercase put: value].
	^fields
    ]

    convertPostDataFrom: aValue [
	<category: 'private-serving'>
	(aValue filename isNil or: [aValue filename isEmpty])
	    ifTrue: [^self decode: aValue value]
	    ifFalse: [
		^ILFileProxy new
		    filename: aValue filename;
		    contentType: aValue contentType;
		    contents: aValue value;
		    yourself]
    ]

    convertRequest: aSwazooRequest [
	<category: 'private-serving'>
	^ILRequest new
	    method: aSwazooRequest methodName;
	    url: (ILUrl absolute: aSwazooRequest uriString);
	    headers: (self convertHeader: aSwazooRequest);
	    fields: (self parseFields: aSwazooRequest);
	    cookies: (self parseCookies: aSwazooRequest);
	    nativeRequest: aSwazooRequest;
	    yourself
    ]

    convertResponse: aResponse [
	<category: 'private-serving'>
	| swazooResponse |
	swazooResponse := Swazoo.HTTPResponse new.
	aResponse headers do: [:each |
	    | field fieldClass |
	    fieldClass := Swazoo.HeaderField classForFieldName: each key.
	    field := fieldClass newForFieldName: each key withValueFrom: each value.
	    swazooResponse headers addField: field].
	aResponse cookies do: [:each |
	    swazooResponse cookie: (self cookieHeaderFor: each)].
	swazooResponse code: aResponse status.
	swazooResponse entity: ((self isBinaryResponse: aResponse)
	    ifTrue: [aResponse contents]
	    ifFalse: [self encode: aResponse contents]).
	swazooResponse contentType: aResponse contentType greaseString.
	aResponse release.
	^swazooResponse
    ]

    cookieHeaderFor: aCookie [
	<category: 'private-serving'>
	^String streamContents: [:stream |
	    stream
		nextPutAll: aCookie key;
		nextPutAll: '=';
		nextPutAll: (aCookie value ifNil: ['']).
	    aCookie path isNil ifFalse: [
		stream
		    nextPutAll: '; path=';
		    nextPutAll: aCookie path].
	    aCookie expiry isNil ifFalse: [
		stream
		    nextPutAll: '; expires=';
		    nextPutAll: aCookie expiryString]]
    ]

    decode: aString [
	<category: 'private-serving'>
	^self codec decode: aString
    ]

    encode: aString [
	<category: 'private-serving'>
	^self codec encode: aString
    ]

    isBinaryResponse: aResponse [
	| tokens type subTypes |
	tokens := aResponse contentType tokenize: '/'.
	type := tokens first.
	type = 'text' ifTrue: [^false].
	tokens size = 1 ifTrue: [^true].
	subTypes := tokens second tokenize: '\+'.
	^subTypes noneSatisfy: [:each |
	    #('x-javascript' 'xml' 'json') includes: each]
    ]

    parseCookies: aSwazooRequest [
	<category: 'private-serving'>
	| cookies swazooCookies cookieLine |
	cookies := Dictionary new.
	cookieLine := aSwazooRequest cookie.
	(cookieLine isNil or: [cookieLine isEmpty]) ifTrue: [^cookies].
	swazooCookies := cookieLine tokenize: ';'.
	swazooCookies do: [:each || pair key value |
	    pair := each tokenize: '='.
	    key := SpStringUtilities trimBlanksFrom: pair first.
	    value := pair size > 1 
		ifTrue: [SpStringUtilities trimBlanksFrom: pair second]
		ifFalse: [nil].
	    cookies at: key put: value].
	^cookies
    ]

    parseFields: aSwazooRequest [
	<category: 'private-serving'>
	| fields |
	fields := Dictionary new.
	aSwazooRequest isPost 
	    ifTrue: ["break encapsulation"

		aSwazooRequest ensureFullRead.
		aSwazooRequest postData keysAndValuesDo: [:key :value | 
		    | previousData data |
		    data := self convertPostDataFrom: value.
		    previousData := fields at: key ifAbsent: [nil].
		    previousData isNil 
			ifTrue: [fields at: key put: data]
			ifFalse: [
			    (previousData isKindOf: OrderedCollection) 
				ifTrue: [previousData add: data]
				ifFalse: [fields at: key put: (OrderedCollection with: previousData with: data)]]]]
	    ifFalse: 
		[aSwazooRequest queries do: [:each | fields at: each key put: each value]].
	^fields
    ]

    helpResolve: aResolution [
	<category: 'accessing'>
	(self canAnswer and: [aResolution siteMatch: self]) ifFalse: [^nil].
	^self answerTo: aResolution request
    ]
]
