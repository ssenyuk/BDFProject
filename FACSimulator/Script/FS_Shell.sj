//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_InstrumentView
//USEUNIT FS_FCSFileView 
//USEUNIT FS_DataEditorView
//USEUNIT FS_FluidicsView
//USEUNIT FS_OpticsConfigView
//USEUNIT FS_CombinedLoaderView

var FSShell = WPFContainer.extend({
    ItemClrClassName: "TreeViewItem", // TestComplete type for items collection
    ItemType: WPFClickable, // framework type for items collection
    ItemDepth: 20,
    ContainedItemsClassMap: {
        InstrumentView: FSInstrumentView,
        FCSFileView: FSFCSFileView,
        DataEditorView: FSDataEditorView,
        FluidicsView: FSFluidicsView,
        OpticsConfigView: FSOpticsConfigView,
        CombinedLoaderView: FSCombinedLoaderView    
    },
    
    // override: get the ClrClassName of the current contained item
    getCurrentClrClassName: function(){
        var buttonNames = {
            "Instrument": "InstrumentView",
            "FCS Data": "FCSFileView",
            "Sim Data": "DataEditorView",
            "Fluidics": "FluidicsView",
            "Optics": "OpticsConfigView",
            "Loader": "CombinedLoaderView"
        }; 
    
        return buttonNames[this.Selected.Text]; 
    }
})