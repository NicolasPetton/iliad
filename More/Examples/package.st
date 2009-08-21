Eval [
  PackageBuilder new
    name: 'Iliad-More-Examples';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';
    prereq: 'Iliad-More-UI';
    prereq: 'Iliad-More-Magritte';

    filein: 'Counter.st'; 
    filein: 'CounterApplication.st'; 
    filein: 'TodoListItem.st'; 
    filein: 'TodoListItemRepository.st'; 
    filein: 'TodoListGridWidget.st'; 
    filein: 'TodoListItemEditor.st'; 
    filein: 'TodoListApplication.st'; 
    filein: 'BlogPost.st';
    filein: 'BlogRepository.st';
    filein: 'BlogApplication.st';

    buildXml
]
