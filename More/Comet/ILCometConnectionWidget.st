ILWidget subclass: ILCometConnectionWidget [
    
    handler [
	<category: 'accessing'>
	^self session cometHandler
    ]

    push [
	<category: 'actions'>
	self handler waitForEvent.
	self markDirty
    ]

    contents [
	<category: 'building'>
	^[:e || action | 
	    action := self session registerActionFor: [self push].
	    e script: 'jQuery(document).ready(function() {iliad.evaluateAction("', (self context urlBuilder urlForAction: action) greaseString, '")})']
    ]
]

