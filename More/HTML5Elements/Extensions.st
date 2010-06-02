ILHTMLBuilderElement extend [

    video [
	<category: '*Iliad-More-HTML5'>
	^self add: ILVideoElement new
    ]

    audio [
	<category: '*Iliad-More-HTML5'>
	^self add: ILAudioElement new
    ]

]
