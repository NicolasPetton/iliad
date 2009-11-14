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
    filein: 'Paginator.st'; 
    filein: 'DataGrid.st'; 
    filein: 'PagedDataGrid.st'; 
    filein: 'Tree.st'; 
    filein: 'MessageDecorator.st'; 
    filein: 'ApplicationBrowser.st';

    resource: 'Public/javascripts/lightbox.js';
    resource: 'Public/stylesheets/lightbox.css';
    resource: 'Public/stylesheets/iliad-ui.css';
    resource: 'Public/images/arrow_down.png';
    resource: 'Public/images/arrow_right.png';

    filein: 'postLoad.st';
    
    buildXml
]
