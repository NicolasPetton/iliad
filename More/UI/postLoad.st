Eval [
    ILFileHandler addDirectory: 
	(ILDiskDirectory new 
	    directory: (PackageLoader packageAt: 'Iliad-More-UI') directory / 'Public';
	    yourself)
]
