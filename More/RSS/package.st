Eval [
  PackageBuilder new
    name: 'Iliad-More-RSS';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';

    filein: 'RSSElement.st'; 
    filein: 'RSSCategoryElement.st'; 
    filein: 'RSSCloudElement.st'; 
    filein: 'RSSCommentsElement.st'; 
    filein: 'RSSEnclosure.st'; 
    filein: 'RSSGuidElement.st'; 
    filein: 'RSSRssElement.st'; 
    filein: 'RSSSourceElement.st'; 
    
    buildXml
]
