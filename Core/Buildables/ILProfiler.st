"======================================================================
|
|   Iliad.ILProfiler class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
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



ILDecorator subclass: ILProfiler [
    
    <comment: nil>
    <category: 'Iliad-Core-Buildables'>

    contents [
	<category: 'building'>
	^[:e |
	    Transcript 
		show: '-- Iliad Profiler on: ', self widget printString , ' --';
		cr.
	    [e build: self decoratee contents] profile do: [:each | 
		Transcript show: each printString; cr].
	]
    ]
]

BlockClosure extend [
    
    profile [
	<category: 'profiling'>
	| results workProcess finished s profProcess |
	s := Semaphore new.
	results := IdentityBag new.
	workProcess := Processor activeProcess.
	finished := false.
	profProcess := [
	    [(Delay forMilliseconds: 5) wait.
	    finished] whileFalse: [
		results add: workProcess suspendedContext method].
	    s signal] 
		forkAt: Processor highIOPriority.
	self ensure: [
	    finished := true.
	    s wait.
	    ^results sortedByCount]	
    ]
]

Bag subclass: IdentityBag [
    <category: nil>
    <comment: nil>

    dictionaryClass [
	^IdentityDictionary
    ]
]

