Eval [
    ILFileHandler addDirectory: 
	(ILDiskDirectory new
	    directory: (PackageLoader packageAt: 'Iliad-More-Formula') directory / 'Public';
	    yourself)
]
