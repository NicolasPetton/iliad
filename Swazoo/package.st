Eval [
  PackageBuilder new
    name: 'Iliad-Swazoo';
    namespace: 'Iliad';
    prereq: 'Swazoo';
    prereq: 'Iliad-Core';
    filein: 'ILSite.st';
    filein: 'SwazooIliad.st';

    start: 'Iliad.SwazooIliad startOn: (%1
	ifNil: [Iliad.ILSite defaultPort]
	ifNotNil: [:port | port asNumber])';
    "stop: 'Iliad.SwazooIliad stop';"

    buildXml
]
