//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_ExperimentsWorkspace
//USEUNIT FS_HomeWorkspace
//USEUNIT FS_InstrumentsWorkspace
//USEUNIT FS_LibraryWorkspace
//USEUNIT FS_WorklistsWorkspace

var FSWorkspaceContainer = WPFContainer.extend({
    ItemClrClassName: "NavIcon", // TestComplete type for items collection
    ItemType: WPFClickable, // framework type for items collection
    ItemDepth: 20,
    ContainedItemsClassMap: {
        HomeView: FSHomeWorkspace,
        InstrumentsLandingView: FSInstrumentsWorkspace,
        ExperimentsLandingView: FSExperimentsWorkspace,
        WorklistsLandingView: FSWorklistsWorkspace,
        LibraryLandingView: FSLibraryWorkspace
    },                
    
    // override: get the ClrClassName of the current contained item
    getCurrentClrClassName: function(){

        var contentControl = this.Finder.find({ClrClassName: "ContentControl", Depth: 10}); 
        
        if (contentControl && 
            contentControl.TCObject &&
            contentControl.TCObject.Content &&
            contentControl.TCObject.Content.ClrClassName) {
                // name of the currently selected workspace, e.g. "HomeView"
                return contentControl.TCObject.Content.ClrClassName; 
        }
        
        return ""; 
    }, 
    
    logStart: function(){
        Log.AppendFolder("WorkspaceContainer"); 
    }
})