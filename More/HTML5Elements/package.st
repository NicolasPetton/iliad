Eval [
  PackageBuilder new
    name: 'Iliad-More-HTML5Elements';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';

    filein: 'ILAudioElement.st'; 
    filein: 'ILCanvasElement.st'; 
    filein: 'ILCommandElement.st'; 
    filein: 'ILDetailsElement.st'; 
    filein: 'ILMenuElement.st'; 
    filein: 'ILMeterElement.st'; 
    filein: 'ILProgressElement.st'; 
    filein: 'ILSearchInputElement.st'; 
    filein: 'ILSourceElement.st'; 
    filein: 'ILTimeElement.st'; 
    filein: 'ILVideoElement.st';
    filein: 'Extensions.st';
    buildXml
]
