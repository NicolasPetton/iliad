"======================================================================
|
|   Magritte.MATextAreaWidget class definition
|
 ======================================================================"

"======================================================================
|
| copyright (c) 2008-2009 
| nicolas petton <petton.nicolas@gmail.com>,
| sébastien audier <sebastien.audier@gmail.com>
|
| adapted from magritte-seaside written by lukas renggli 
| http://source.lukas-renggli.ch/magritte.
|
| this file is part of the iliad framework.
|
| permission is hereby granted, free of charge, to any person obtaining
| a copy of this software and associated documentation files (the 
| 'software'), to deal in the software without restriction, including 
| without limitation the rights to use, copy, modify, merge, publish, 
| distribute, sublicense, and/or sell copies of the software, and to 
| permit persons to whom the software is furnished to do so, subject to 
| the following conditions:
|
| the above copyright notice and this permission notice shall be 
| included in all copies or substantial portions of the software.
|
| the software is provided 'as is', without warranty of any kind, 
| express or implied, including but not limited to the warranties of 
| merchantability, fitness for a particular purpose and noninfringement. 
| in no event shall the authors or copyright holders be liable for any 
| claim, damages or other liability, whether in an action of contract, 
| tort or otherwise, arising from, out of or in connection with the 
| software or the use or other dealings in the software.  
|
 ======================================================================"



MAElementWidget subclass: MATextAreaWidget [
    
    <comment: 'I display an html text area for the magritte MAMemoDescription.'>
    <category: 'Iliad-More-Magritte-Widgets'>

    MATextAreaWidget class >> isAbstract [
	<category: 'testing'>
	^false
    ]

    editorContents [
	<category: 'buidling'>
	^[:e | 
	    e textarea
		id: self labelId;
		rows: self description lineCount;
		text: self string;
		action: [:val | self string: val]]
    ]

    viewerContents [
	<category: 'buidling'>
	^[:e | 
	    (self string tokenize: Character cr asString)
		do: [:each | e text: each]
		separatedBy: [e br]]
    ]

    hasLabelId [
	<category: 'testing'>
	^self isReadonly not
    ]
]

