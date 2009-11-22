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
    filein: 'Unit/Elements/ILFieldsetElementTest.st';
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

    filein: 'Unit/lib/JSON/ILJsonDummyTestObject.st';
    filein: 'Unit/lib/JSON/ILJsonTest.st';

    filein: 'Unit/Sessions/ILActionRegistryTest.st';
    filein: 'Unit/Sessions/ILActionTest.st';
    filein: 'Unit/Sessions/ILCurrentContextTest.st';
    filein: 'Unit/Sessions/ILSessionManagerTest.st';
    filein: 'Unit/Sessions/ILUrlBuilderTest.st';
    filein: 'Unit/Sessions/ILSessionTest.st';

    filein: 'Unit/Utilities/ILIdTest.st';
    filein: 'Unit/Utilities/ILModelProxyTest.st'; 
    filein: 'Unit/Utilities/ILCompositeTest.st';

    filein: 'Unit/RequestHandlers/ILRequestHandlerTest.st'; 

    filein: 'Unit/RSS/ILRSSElementTest.st';
    filein: 'Unit/RSS/ILRSSRssElementTest.st';
    filein: 'Unit/RSS/ILRSSCategoryElementTest.st';
    filein: 'Unit/RSS/ILRSSCloudElementTest.st';   
    filein: 'Unit/RSS/ILRSSCommentsElementTest.st'; 
    filein: 'Unit/RSS/ILRSSEnclosureElementTest.st'; 
    filein: 'Unit/RSS/ILRSSGuidElementTest.st'; 
    filein: 'Unit/RSS/ILRSSSourceElementTest.st'; 
    buildXml
]
