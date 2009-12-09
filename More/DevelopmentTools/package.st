Eval [
    | builder pubDir |
    builder := PackageBuilder new
	name: 'Iliad-More-DevelopmentTools';
	namespace: 'Iliad';
	prereq: 'Iliad-More-UI';

	filein: 'ILDevelopmentTool.st'; 
	filein: 'ILDevelopmentDecorator.st'; 
	filein: 'ILWorkspace.st'; 
	yourself.

    pubDir := Directory working / 'Public'.
    pubDir all do: [:each |
	each isFile ifTrue: [
	    builder resource: (each pathFrom: Directory working)]].

	builder buildXml
]
