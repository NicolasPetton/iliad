ILObject subclass: ILCometSubscription [
    | handler widget eventClass |

    <category: 'Iliad-More-Comet'>

    handler: aCometHandler [
	<category: 'accessing'>
	handler := aCometHandler
    ]

    handler [
	<category: 'accessing'>
	^handler
    ]

    session [
	<category: 'accessing'>
	^self handler session
    ]

    widget [
	<category: 'accessing'>
	^widget
    ]

    widget: aWidget [
	<category: 'accessing'>
	widget := aWidget
    ]

    eventClass [
	<category: 'accessing'>
	^eventClass
    ]

    eventClass: aClass [
	<category: 'accessing'>
	eventClass := aClass
    ]

    handleEvent: anEvent [
	<category: 'actions'>
	(anEvent isKindOf: self eventClass) ifTrue: [
	    self widget handleCometEvent: anEvent.
	    self handler shouldPush]
    ]
]

