//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_ExperimentView
//USEUNIT FS_ManageExperimentsView

var FSExperimentsWorkspace = WPFContainer.extend({
    ItemClrClassName: "WorkspaceTabItem", // TestComplete type for items collection
    ItemType: WPFWorkspaceTabItem, // framework type for items collection
    ItemDepth: 20,
    Name: "ExperimentsWorkspace",
    // List the items that can be inside the container
    // map between TC ClrClassNames and framework class types.
    // The property key values here are unique ClrClassNames.     
    ContainedItemsClassMap: {
        ManageExperimentsView: FSManageExperimentsView,
        ExperimentView: FSExperimentView
    },    
           
    // override: get the ClrClassName of the current contained item
    getCurrentClrClassName: function(){
        return this.Selected.Text == "Manage Experiments" 
            ? "ManageExperimentsView" : "ExperimentView"; 
    },   
    
    logStart: function(){
        Log.AppendFolder("ExperimentsWorkspace"); 
    }
});