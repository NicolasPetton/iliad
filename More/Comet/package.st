Eval [
  PackageBuilder new
    name: 'Iliad-More-Comet';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';

    filein: 'ILCometHandler.st'; 
    filein: 'ILCometEvent.st'; 
    filein: 'ILCometSubscription.st'; 
    filein: 'ILCometConnectionWidget.st'; 
    filein: 'Extensions.st'; 

    buildXml
]
