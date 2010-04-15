ILWidget extend [

    pushOnCometEvent: anEventClass condition: aBlock [
	"Register the receiver to push its contents to the client when the event <anEvent> occurs."
	<category: '*Iliad-More-Comet'>

	self session cometHandler
	    subscribe: self
	    to: anEventClass
	    condition: aBlock
    ]

    pushOnCometEvent: anEventClass [
	"Register the receiver to push its contents to the client when the event <anEvent> occurs."
	<category: '*Iliad-More-Comet'>
	
	self pushOnCometEvent: anEventClass condition: [:event | true]
    ]

    triggerCometEvent: anEvent [
	"Update all widgets which registered to the event <anEvent>"
	<category: '*Iliad-More-Comet'>
	self session cometHandler triggerEvent: anEvent
    ]
]

ILApplication extend [
    
   cometConnexion [
	<category: '*Iliad-More-Comet'>
	^self 
	    attributeAt: #cometConnexion
	    ifAbsentPut: [ILCometConnectionWidget new]
   ] 
]

ILSession extend [
    
    cometHandler [
	<category: '*Iliad-More-Comet'>
	^self otherAt: #cometHandler ifAbsentPut: [ILCometHandler on: self]
    ]
]
