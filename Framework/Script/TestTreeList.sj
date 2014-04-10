//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){
    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Experiments workspace | Manage Experiments tab. " +
            "You must have a 'BDAdministrator' root item and 'Folder_001' sub folder." +
            "The root node must be collapsed.",
        TestFunction: function(window){
            var element = window
                .Finder
                .find({NativeClrObject : "ExperimentFolderTree", Depth: 40}); 
            
            if (element){
                treeView = element
                    .cast(WPFTreeListView)
                    .log(); 
                    
                treeView
                    .item({Text: "BDAdministrator"})
                    .toggleExpand(); 
                
                var folder = treeView
                    .item({Text: "Folder_001"}); 
                
                if (folder){
                    folder.click();
                } else {
                    this.error("Folder_001 not found"); 
                }
            
            } else {
                this.error("ExperimentFolderTree not found"); 
            }       
        }
    }).run();
}