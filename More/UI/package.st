Eval [
  PackageBuilder new
    name: 'Iliad-More-UI';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';

    filein: 'UIWidget.st'; 
    filein: 'Box.st'; 
    filein: 'VerticalBox.st'; 
    filein: 'HorizontalBox.st'; 
    filein: 'Paned.st'; 
    filein: 'HorizontallyPaned.st'; 
    filein: 'VerticallyPaned.st'; 
    filein: 'TimeSelector.st'; 
    filein: 'DateSelector.st'; 
    filein: 'Lightbox.st'; 
    filein: 'Calendar.st'; 
    filein: 'Extensions.st'; 
    filein: 'Tabs.st'; 
    filein: 'Tree.st'; 
    filein: 'ApplicationBrowser.st';
    
    buildXml
]
