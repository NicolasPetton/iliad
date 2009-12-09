ILWidget subclass: ILWorkspace [
    | source result |


    <category: 'Iliad-More-DevelopmentTools'>
    <comment: nil>

    source [
	<category: 'accessing'>
	^source ifNil: ['']
    ]

    source: aString [
	<category: 'accessing'>
	source := aString
    ]

    result [
	<category: 'accessing'>
	^result ifNil: ['']
    ]

    result: aString [
	<category: 'accessing'>
	result := aString
    ]


    doIt: aString [
	<category: 'actions'>
	self source: aString.
	result := Behavior 
	    evaluate: self source
	    ifError: [:err | err printString].
	self markDirty
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e div 
		class: 'workspace';
		build: self resultContents;
		build: self sourceInputContents]
    ]

    resultContents [
	<category: 'building'>
	^[:e |
	    e div class: 'result';
	    text: self result]
    ]

    sourceInputContents [
	<category: 'building'>
	^[:e |
	    (e div class: 'source')
		form build: [:form |
		    form input 
			value: self source;
			action: [:str | self doIt: str];
			beSubmitOnClick]]
    ]
]
