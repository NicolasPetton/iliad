Object extend [
    
    printHtmlOn: aStream [
	<category: '*Iliad-Core'>
	self displayOn: aStream
    ]

    printEncodedOn: aStream [
	<category: '*Iliad-Core'>
	Iliad.ILEncoder encodeForHTTP: self greaseString on: aStream
    ]
]
