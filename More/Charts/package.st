Eval [
    | builder pubDir |  
    builder := PackageBuilder new
	name: 'Iliad-More-Charts';
	namespace: 'Iliad';
	prereq: 'Iliad-Core';
	filein: 'ILChart.st';
	filein: 'postLoad.st';
	yourself.

    pubDir := Directory working / 'Public'.
    pubDir all do: [:each |
	each isFile ifTrue: [
	    builder resource: (each pathFrom: Directory working)]].

    builder buildXml
]
