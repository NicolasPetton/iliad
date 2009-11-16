Eval [
    | builder pubDir |
    builder := PackageBuilder new
	name: 'Iliad-More-UI';
	namespace: 'Iliad';
	prereq: 'Iliad-Core';

	filein: 'UIWidget.st'; 
	filein: 'TimeSelector.st'; 
	filein: 'DateSelector.st'; 
	filein: 'Lightbox.st'; 
	filein: 'Calendar.st'; 
	filein: 'Extensions.st'; 
	filein: 'WidgetTabs.st'; 
	filein: 'ViewTabs.st'; 
	filein: 'Paginator.st'; 
	filein: 'DataGrid.st'; 
	filein: 'PagedDataGrid.st'; 
	filein: 'Tree.st'; 
	filein: 'MessageDecorator.st'; 
	filein: 'ApplicationBrowser.st';
	filein: 'postLoad.st';
	yourself.

    pubDir := Directory working / 'Public'.
    pubDir all do: [:each |
	each isFile ifTrue: [
	    builder resource: (each pathFrom: Directory working)]].

	builder buildXml
]
