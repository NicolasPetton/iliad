ILObject subclass: ILCometSubscription [
    | handler widget eventClass condition |

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

    condition [
	<category: 'accessing'>
	^condition
    ]

    condition: aBlock [
	<category: 'accessing'>
	condition := aBlock
    ]

    handleEvent: anEvent [
	<category: 'actions'>
	((anEvent isKindOf: self eventClass) and: [
	    self condition value: anEvent]) ifTrue: [
		self widget markDirty.
		self handler shouldPush]
    ]
]

