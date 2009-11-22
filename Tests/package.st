Eval [
  PackageBuilder new
    name: 'Iliad-Tests';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';
    prereq: 'Iliad-More';
    prereq: 'SUnit';
    testsBelow: 'Unit' matching: '*.st';

    filein: 'Unit/Buildables/ILApplicationMock1.st';
    filein: 'Unit/Buildables/ILApplicationMock2.st';
    filein: 'Unit/Buildables/ILApplicationTest.st';
    filein: 'Unit/Buildables/ILWidgetMock1.st';
    filein: 'Unit/Buildables/ILWidgetMock2.st';
    filein: 'Unit/Buildables/ILWidgetMock3.st';
    filein: 'Unit/Buildables/ILWidgetTest.st';

    filein: 'Unit/Dispatching/ILDispatcherTest.st';
    filein: 'Unit/Dispatching/ILRouteTest.st';

    filein: 'Unit/Elements/ILElementTest.st';
    filein: 'Unit/Elements/ILXHTMLElementTest.st';
    filein: 'Unit/Elements/ILAnchorElementTest.st';
    filein: 'Unit/Elements/ILAreaElementTest.st';
    filein: 'Unit/Elements/ILBodyElementTest.st';
    filein: 'Unit/Elements/ILButtonElementTest.st';
    filein: 'Unit/Elements/ILCheckboxElementTest.st';
    filein: 'Unit/Elements/ILDirectionElementTest.st';
    filein: 'Unit/Elements/ILFormElementElementTest.st';
    filein: 'Unit/Elements/ILFormElementTest.st';
    filein: 'Unit/Elements/ILHeadElementTest.st';
    filein: 'Unit/Elements/ILHeadingElementTest.st';
    filein: 'Unit/Elements/ILHtmlElementTest.st';
    filein: 'Unit/Elements/ILImageElementTest.st';
    filein: 'Unit/Elements/ILInputElementTest.st';
    filein: 'Unit/Elements/ILLabelElementTest.st';
    filein: 'Unit/Elements/ILLegendElementTest.st';
    filein: 'Unit/Elements/ILLinkElementTest.st';
    filein: 'Unit/Elements/ILLinkableElementTest.st';
    filein: 'Unit/Elements/ILListElementTest.st';
    filein: 'Unit/Elements/ILListItemElementTest.st';
    filein: 'Unit/Elements/ILMapElementTest.st';
    filein: 'Unit/Elements/ILMetaElementTest.st';
    filein: 'Unit/Elements/ILObjectElementTest.st';
    filein: 'Unit/Elements/ILOptionElementTest.st';
    filein: 'Unit/Elements/ILOptionGroupElementTest.st';
    filein: 'Unit/Elements/ILParameterElementTest.st';
    filein: 'Unit/Elements/ILParagraphElementTest.st';
    filein: 'Unit/Elements/ILRadioButtonElementTest.st';
    filein: 'Unit/Elements/ILRubyTextElementTest.st';
    filein: 'Unit/Elements/ILScriptElementTest.st';
    filein: 'Unit/Elements/ILSelectElementTest.st';
    filein: 'Unit/Elements/ILSpanElementTest.st';
    filein: 'Unit/Elements/ILTableBodyElementTest.st';
    filein: 'Unit/Elements/ILHorizontalRuleElementTest.st';
    filein: 'Unit/Elements/ILTableCellElementTest.st';
    filein: 'Unit/Elements/ILTableDataElementTest.st';
    filein: 'Unit/Elements/ILTableElementElementTest.st';
    filein: 'Unit/Elements/ILTableElementTest.st';
    filein: 'Unit/Elements/ILTableFootElementTest.st';
    filein: 'Unit/Elements/ILTableHeadElementTest.st';
    filein: 'Unit/Elements/ILTableHeaderElementTest.st';
    filein: 'Unit/Elements/ILTableRowElementTest.st';
    filein: 'Unit/Elements/ILTextAreaElementTest.st';
    filein: 'Unit/Elements/ILTextElementTest.st';
    filein: 'Unit/Elements/ILTitleElementTest.st';
    filein: 'Unit/Elements/ILBreakElementTest.st';

    filein: 'Unit/lib/JSON/JsonDummyTestObject.st';
    filein: 'Unit/lib/JSON/JsonTest.st';

    filein: 'Unit/Sessions/ActionRegistryTest.st';
    filein: 'Unit/Sessions/ActionTest.st';
    filein: 'Unit/Sessions/CurrentContextTest.st';
    filein: 'Unit/Sessions/SessionManagerTest.st';
    filein: 'Unit/Sessions/UrlBuilderTest.st';
    filein: 'Unit/Sessions/SessionTest.st';

    filein: 'Unit/Utilities/IdTest.st';
    filein: 'Unit/Utilities/ModelProxyTest.st'; 
    filein: 'Unit/Utilities/CompositeTest.st';

    filein: 'Unit/RequestHandlers/RequestHandlerTest.st'; 

    filein: 'Unit/RSS/RSSElementTest.st';
    filein: 'Unit/RSS/RSSRssElementTest.st';
    filein: 'Unit/RSS/RSSCategoryElementTest.st';
    filein: 'Unit/RSS/RSSCloudElementTest.st';   
    filein: 'Unit/RSS/RSSCommentsElementTest.st'; 
    filein: 'Unit/RSS/RSSEnclosureElementTest.st'; 
    filein: 'Unit/RSS/RSSGuidElementTest.st'; 
    filein: 'Unit/RSS/RSSSourceElementTest.st'; 
    buildXml
]
