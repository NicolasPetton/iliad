Eval [
  PackageBuilder new
    name: 'Iliad-More-RSS';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';

    filein: 'ILRSSElement.st'; 
    filein: 'ILRSSCategoryElement.st'; 
    filein: 'ILRSSCloudElement.st'; 
    filein: 'ILRSSCommentsElement.st'; 
    filein: 'ILRSSEnclosureElement.st'; 
    filein: 'ILRSSGuidElement.st'; 
    filein: 'ILRSSRssElement.st'; 
    filein: 'ILRSSSourceElement.st'; 
    
    buildXml
]
