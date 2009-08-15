Eval [
    PackageBuilder new
	name: 'Iliad-More-Magritte';
	namespace: 'Magritte';
	prereq: 'Iliad-Core';
	prereq: 'Iliad-More-UI';
	prereq: 'Magritte';

	filein: 'Builders/MAWidgetBuilder.st';
	filein: 'Builders/MATableBuilder.st'; 

	filein: 'Widgets/MAWidget.st'; 

	filein: 'Report/MAColumnWidget.st'; 
	filein: 'Report/MAActionColumnWidget.st'; 
	filein: 'Report/MACommandColumnWidget.st'; 
	filein: 'Report/MAIndexedCommandColumnWidget.st'; 
	filein: 'Report/MASelectionColumnWidget.st'; 
	filein: 'Report/MACheckboxColumnWidget.st'; 
	filein: 'Report/MADescribedColumnWidget.st'; 
	filein: 'Report/MADescribedScalarColumnWidget.st'; 
	filein: 'Report/MAToggleColumnWidget.st'; 
	filein: 'Report/MAReportWidget.st'; 

	filein: 'Widgets/MADescriptionWidget.st'; 
	filein: 'Widgets/MAContainerWidget.st'; 
	filein: 'Widgets/MAElementWidget.st'; 
	filein: 'Widgets/MACheckboxWidget.st'; 
	filein: 'Widgets/MAFileUploadWidget.st'; 
	filein: 'Widgets/MAOptionWidget.st'; 
	filein: 'Widgets/MAMultipleSelectionWidget.st'; 
	filein: 'Widgets/MACheckboxGroupWidget.st'; 
	filein: 'Widgets/MAMultiselectListWidget.st'; 
	filein: 'Widgets/MASingleSelectionWidget.st'; 
	filein: 'Widgets/MASelectListWidget.st'; 
	filein: 'Widgets/MARelationWidget.st'; 
	filein: 'Widgets/MAOneToOneWidget.st'; 
	filein: 'Widgets/MAOneToManyWidget.st'; 
	filein: 'Widgets/MAExternalEditorWidget.st'; 
	filein: 'Widgets/MAInternalEditorWidget.st'; 
	filein: 'Widgets/MATextAreaWidget.st'; 
	filein: 'Widgets/MATextInputWidget.st'; 
	filein: 'Widgets/MADateSelectorWidget.st'; 
	filein: 'Widgets/MATimeSelectorWidget.st'; 
	filein: 'Widgets/MATimeStampSelectorWidget.st'; 
	filein: 'Widgets/MATextPasswordWidget.st'; 
	filein: 'Widgets/MAVerifiedPasswordWidget.st'; 
	filein: 'Widgets/MAUndefinedWidget.st'; 

	filein: 'Decorators/MAWidgetDecorator.st'; 
	filein: 'Decorators/MAContainerDecorator.st'; 
	filein: 'Decorators/MAFormDecorator.st'; 
	filein: 'Decorators/MASwitchDecorator.st'; 
	filein: 'Decorators/MAValidationDecorator.st'; 

	filein: 'Extensions.st';
	buildXml
]
