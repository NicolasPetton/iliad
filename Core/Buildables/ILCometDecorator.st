ILDecorator subclass: ILCometDecorator [
    | shouldPush |

    <category: 'Iliad-Core-Buildables'>
    <comment: nil>

    initialize [
	<category: 'initialization'>
	super initialize.
	shouldPush := false.
    ]

    registerForEvent: aSymbol [
	<category: 'registering'>
	self session pusher register: self forEvent: aSymbol
    ]

    push [
	<category: 'actions'>
	shouldPush := true
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e 
		build: self cometScript; 
		build: super contents]
    ]

    cometScript [
	<category: 'building'>
	^[:e || action |
	    action := self session registerActionFor: [self pushLoop value].
	    e script: 
		'iliad.evaluateAction("', (self context urlBuilder urlForAction: action) greaseString, '"']
    ]

    pushLoop [
	<category: 'private'>
	^[[shouldPush = true] whileFalse: [
		(Delay forMilliseconds: 10) wait].
	    self widget markDirty.
	    shouldPush := false]
    ]
]
