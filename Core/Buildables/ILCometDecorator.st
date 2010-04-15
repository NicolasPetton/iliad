ILDecorator subclass: ILCometDecorator [

    <category: 'Iliad-Core-Buildables'>
    <comment: nil>

    subscribeTo: anEventClass condition: aBlock [
	<category: 'actions'>
	self session pusher
	    subscribe: self
	    to: anEventClass
	    condition: aBlock
    ]

    push [
	<category: 'actions'>
	self widget markDirty
    ]
]
