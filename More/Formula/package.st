Eval [
    | builder pubDir |  
    builder := PackageBuilder new
	name: 'Iliad-More-Formula';
	namespace: 'Iliad';

	prereq: 'Iliad-Core';
	prereq: 'Iliad-More-UI';

	filein: 'ILCondition.st';
	filein: 'ILAbstractField.st';
	filein: 'ILField.st';
	filein: 'ILInputField.st';
	filein: 'ILNumberInputField.st';
	filein: 'ILAutocompleteInputField.st';
	filein: 'ILTextareaField.st';
	filein: 'ILPasswordField.st';
	filein: 'ILCheckboxField.st';
	filein: 'ILOptionField.st';
	filein: 'ILSelectField.st';
	filein: 'ILMultipleCheckboxField.st';
	filein: 'ILDateInputField.st';
	filein: 'ILTimeInputField.st';
	filein: 'ILFileInputField.st';
	filein: 'ILFormulaField.st';
	filein: 'ILFormula.st';

	filein: 'postLoad.st';
	yourself.

    pubDir := Directory working / 'Public'.
    pubDir all do: [:each |
	each isFile ifTrue: [
	    builder resource: (each pathFrom: Directory working)]].

    builder buildXml
]
