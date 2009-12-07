Eval [
  PackageBuilder new
    name: 'Iliad-More-Examples';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';
    prereq: 'Iliad-More-UI';
    prereq: 'Iliad-More-Magritte';

    filein: 'ILCounter.st'; 
    filein: 'ILCounterApplication.st'; 
    filein: 'ILTodoListItem.st'; 
    filein: 'ILTodoListItemRepository.st'; 
    filein: 'ILTodoListGridWidget.st'; 
    filein: 'ILTodoListItemEditor.st'; 
    filein: 'ILTodoListApplication.st'; 
    filein: 'ILBlogPost.st';
    filein: 'ILBlogRepository.st';
    filein: 'ILBlogApplication.st';
    filein: 'ILGravatarWidget.st';

    buildXml
]
