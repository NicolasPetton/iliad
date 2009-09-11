Eval [
  PackageBuilder new
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
    filein: 'Tree.st'; 
    filein: 'ApplicationBrowser.st';
    
    buildXml
]
