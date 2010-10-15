ILWidget extend [

    subscribeToCometEvent: anEventClass [
	"Register the receiver to push its contents to the client when the event <anEvent> occurs."
	<category: '*Iliad-More-Comet'>

	self session cometHandler
	    subscribe: self
	    to: anEventClass
    ]

    triggerCometEvent: anEvent [
	"Update all widgets which registered to the event <anEvent>"
	<category: '*Iliad-More-Comet'>
	self session cometHandler triggerEvent: anEvent
    ]

    handleCometEvent: anEvent [
	<category: '*Iliad-More-Comet'>
	self markDirty
    ]
]

ILApplication extend [
    
   cometConnection [
	<category: '*Iliad-More-Comet'>
	^self 
	    attributeAt: #cometConnection
	    ifAbsentPut: [ILCometConnectionWidget new]
   ] 
]

ILSession extend [
    
    cometHandler [
	<category: '*Iliad-More-Comet'>
	^self otherAt: #cometHandler ifAbsentPut: [ILCometHandler on: self]
    ]
]
