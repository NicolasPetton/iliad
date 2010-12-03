Eval [
  PackageBuilder new
    name: 'Iliad-More-Examples';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';
    prereq: 'Iliad-More-UI';
    prereq: 'Iliad-More-Formula';
    prereq: 'Iliad-More-Comet';
    prereq: 'Digest';

    filein: 'ILCounter.st'; 
    filein: 'ILCounterApplication.st'; 
    filein: 'ILTodoListItem.st'; 
    filein: 'ILTodoListItemRepository.st'; 
    filein: 'ILTodoListGridWidget.st'; 
    filein: 'ILTodoListApplication.st'; 
    filein: 'ILGravatarWidget.st';
    filein: 'ILCometCounter.st';
    filein: 'ILClassSearchApplication.st';
    filein: 'ILClassSearchWidget.st';

    buildXml
]
