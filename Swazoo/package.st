Eval [
  PackageBuilder new
    name: 'Iliad-Swazoo';
    namespace: 'Iliad';
    prereq: 'Swazoo';
    filein: 'Site.st';
    filein: 'SwazooIliad.st';

    start: 'Iliad.SwazooIliad startOn: (%1
	ifNil: [Iliad.Site defaultPort]
	ifNotNil: [:port | port asNumber])';
    "stop: 'Iliad.SwazooIliad stop';"

    buildXml
]
