Object subclass: SwazooIliad [
    
    <category: 'Iliad-Swazoo'>
    <comment: nil>

    SwazooIliad class >> startOn: aPort [
	<category: 'start/stop'>
	ILSite default port: aPort.
	Swazoo.SwazooServer startSite: ILSite defaultName
    ]

    SwazooIliad class >> stop [
	<category: 'start/stop'>
	Swazoo.SwazooServer stopSite: ILSite defaultName
    ]
]

