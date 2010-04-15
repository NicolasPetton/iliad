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

    push [
	<category: 'accessing'>
	self session addDirtyWidget: self widget.
	self handler push
    ]
]

