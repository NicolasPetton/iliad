"======================================================================
|
|   Iliad.Profiler class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from the Seaside WAProfiler. Seaside is written
| by Avi Bryant, Julian Fitzell, Lukas Renggli, Michel Bany, Philippe
| Marschall and Seaside contributors http://www.seaside.st 
|
| This file is part of the Iliad framework.
|
| Permission is hereby granted, free of charge, to any person obtaining
| a copy of this software and associated documentation files (the 
| 'Software'), to deal in the Software without restriction, including 
| without limitation the rights to use, copy, modify, merge, publish, 
| distribute, sublicense, and/or sell copies of the Software, and to 
| permit persons to whom the Software is furnished to do so, subject to 
| the following conditions:
|
| The above copyright notice and this permission notice shall be 
| included in all copies or substantial portions of the Software.
|
| THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
|
 ======================================================================"



Decorator subclass: Profiler [
    
    <comment: nil>
    <category: 'Iliad-More-Widgets'>

    contents [
	<category: 'building'>
	^
	[:e | 
	| profile |
	profile := self profileSendsDuring: [e build: self decoratee contents].
	Transcript
	    show: '-- Iliad Profiler on: ' , self widget printString , ' --';
	    cr;
	    cr.
	Transcript
	    show: profile;
	    cr;
	    cr]
    ]

    profileSendsDuring: aBlock [
	<category: 'private'>
	| newPage report |
	newPage := Character value: 12.
	Processor activeProcess priority: 20.
	Smalltalk garbageCollectMost.
	report := String streamContents: 
			[:stream | 
			(MessageTally new)
			    spyEvery: 1
				on: 
				    [aBlock value.
				    Smalltalk garbageCollectMost];
			    report: stream].

	"the message tally report has an unprintable character (new page) before the leaves
	 we need to remove it"
	report 
	    withIndexDo: [:each :index | each = newPage ifTrue: [report at: index put: Character space]].
	^report
    ]
]

