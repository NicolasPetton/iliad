Eval [
    | builder pubDir |
    builder := PackageBuilder new
	name: 'Iliad-More-UI';
	namespace: 'Iliad';
	prereq: 'Iliad-Core';

	filein: 'ILUIWidget.st'; 
	filein: 'ILTimeSelector.st'; 
	filein: 'ILDateSelector.st'; 
	filein: 'ILLightbox.st'; 
	filein: 'ILCalendar.st'; 
	filein: 'Extensions.st'; 
	filein: 'ILWidgetTabs.st'; 
	filein: 'ILViewTabs.st'; 
	filein: 'ILPaginator.st'; 
	filein: 'ILDataGrid.st'; 
	filein: 'ILPagedDataGrid.st'; 
	filein: 'ILTree.st'; 
	filein: 'ILMessageDecorator.st'; 
	filein: 'ILApplicationBrowser.st';
	filein: 'postLoad.st';
	yourself.

    pubDir := Directory working / 'Public'.
    pubDir all do: [:each |
	each isFile ifTrue: [
	    builder resource: (each pathFrom: Directory working)]].

	builder buildXml
]
