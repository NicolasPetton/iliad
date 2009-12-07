ILWidget subclass: ILGravatarWidget [
    | emailAddress options |


    <category: 'Iliad-More-Examples'>
    <comment: nil>

    ILGravatarWidget class [
	
	for: aString [
	    <category: 'instance creation'>
	    ^self new 
		emailAddress: aString;
		yourself
	]
    
	hostname [
	    <category: 'accessing'>
	    ^'http://www.gravatar.com/avatar/'
	]
    ]

    emailAddress [
	<category: 'accessing'>
	^emailAddress
    ]

    emailAddress: aString [
	<category: 'accessing'>
	emailAddress := aString
    ]

    hostname [
	<category: 'accessing'>
	^self class hostname
    ]

    gravatarId [
	<category: 'accessing'>
	^MD5 hexDigestOf: self emailAddress
    ]

    url [
	<category: 'accessing'>
	| stream |
	stream := WriteStream on: ''.
	stream 
	    nextPutAll: self hostname;
	    nextPutAll: self gravatarId.
	self options keysAndValuesDo: [:key :value |
	    stream 
		nextPut: $?;
		nextPutAll: key;
		nextPut: $=;
		nextPutAll: (ILEncoder encodeUrl: value)].
	^stream contents
    ]

    options [
	<category: 'accessing options'>
	^options ifNil: [options := Dictionary new]
    ]

    size [
	<category: 'accessing options'>
	^self options at: #size ifAbsent: [nil]
    ]

    size: anInteger [
	<category: 'accessing options'>
	self options at: #size put: anInteger printString
    ]

    rating [
	<category: 'accessing options'>
	^self options at: #rating ifAbsent: [nil]
    ]

    rating: aString [
	<category: 'accessing options'>
	self options at: #rating put: aString
    ]

    default [
	<category: 'accessing options'>
	^self options at: #default ifAbsent: [nil]
    ]

    default: aString [
	<category: 'accessing options'>
	self options at: #default put: aString
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e div 
		class: 'gravatar';
		build: [:div |
		    div img
			src: self url;
			alt: self emailAddress]]
    ]
]
