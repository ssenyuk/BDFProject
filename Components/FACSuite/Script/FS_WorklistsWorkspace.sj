

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_WorklistView
//USEUNIT FS_ManageWorklistView

var FSWorklistsWorkspace = WPFContainer.extend({
    ItemClrClassName: "WorkspaceTabItem", // TestComplete type for items collection
    ItemType: WPFWorkspaceTabItem, // framework type for items collection
    ItemDepth: 20,
    Name: "WorklistsWorkspace",
    // List the items that can be inside the container
    // map between TC ClrClassNames and framework class types.
    // The property key values here are unique ClrClassNames.     
    ContainedItemsClassMap: {
        ManageWorklistView: FSManageWorklistView,
        WorklistView: FSWorklistView
     //   WorklistView1: FSWorklistView
    },    

    // override: get the ClrClassName of the current contained item
    getCurrentClrClassName: function(){
        return this.Selected.Text == "Manage" 
            ? "ManageWorklistView" : "WorklistView"; 
    },  
  /*  
    getCurrentClrClassName: function(){
       
        if ( this.Selected.Text == "Manage") {
           return "ManageWorklistView";
        } else if ( this.Selected.Text == "WorklistView"){
            return "WorklistView";
        } else if ( this.Selected.Text == "WorklistView1"){
            return "WorklistView1";
        } else { 
             return "none";
        }
    },  
    */
    /* @description This function will be used to close current tab.
    */ 
    closeCurrentTab:function(){
          var currentTabItem = this.Finder.find({IsSelected:"True", ClrClassName:"WorkspaceTabItem"});
          currentTabItem.TCObject.Close();
    },
    
    logStart: function(){
        Log.AppendFolder("WorklistsWorkspace"); 
    }
});
