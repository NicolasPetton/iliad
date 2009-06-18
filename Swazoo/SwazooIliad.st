Object subclass: SwazooIliad [
    
    <category: 'Iliad-Swazoo'>
    <comment: nil>

    SwazooIliad class >> startOn: aPort [
	<category: 'start/stop'>
	Site default port: aPort.
	Swazoo.SwazooServer startSite: Site defaultName
    ]

    SwazooIliad class >> stop [
	<category: 'start/stop'>
	Swazoo.SwazooServer stopSite: Site defaultName
    ]
]

