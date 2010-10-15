Eval [
    (Directory image / 'Public') exists ifTrue: [
        ILFileHandler addDirectory: 
	   (ILDiskDirectory new 
		directory: (Directory image / 'Public');
		yourself)].
    ILFileHandler addDirectory:
        (ILDiskDirectory new
    	directory: (PackageLoader packageAt: 'Iliad-Core') directory / 'Public';
    	yourself).
]
