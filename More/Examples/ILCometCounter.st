ILApplication subclass: ILCometCounterApplication [
    | counter |    

    ILCometCounterApplication class >> path [^'examples/comet']

    initialize [
	super initialize.
	counter := ILCometCounter new
    ]

    index [
	<category: 'controllers'>
	^[:e |
	    e 
		build: self cometConnection; 
		build: counter]
    ]
]


ILObject subclass: ILCounterModel [
    | count |


    ILCounterModel class [
	| instance |
	
	instance [
	    instance ifNil: [instance := self new].
	    ^instance
	]
    ]

    initialize [
	super initialize.
	count := 0
    ]

    count [
	^count
    ]

    increase [
	count := count + 1
    ]

    decrease [
	count := count -1
    ]
]

ILCometEvent subclass: ILCounterChangedEvent []


Iliad.ILWidget subclass: ILCometCounter [
    | counter |

    initialize [
	super initialize.
	counter := ILCounterModel instance.
	self subscribeToCometEvent: ILCounterChangedEvent
    ]

    contents [
	^[:e |
	    e h1: counter count printString.
	    e a action: [self increase]; text: '++'.
	    e a action: [self decrease]; text: '--']
    ]

    increase [
	counter increase.
	self markDirty.
	self triggerCometEvent: ILCounterChangedEvent new
    ]

    decrease [
	counter decrease.
	self markDirty.
	self triggerCometEvent: ILCounterChangedEvent new
    ]
]
