//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Setup & QC workspace | Configurations tab.",
        TestFunction: function(window){
           var workspace = window
                .Finder
                .find({ClrClassName : "Workspace", Depth: 40})
                .cast(Element); 
            
            var panes = workspace
                .Finder
                .findAll({ClrClassName : "WorkspacePane", VisibleOnScreen: true, Enabled: true, Depth: 40});
            
            for(var prop in panes){
                var pane = panes[prop].cast(WPFWorkspacePane);
                if (pane.Buttons.Maximize.Visible){
                    pane.Buttons.Maximize.click(); 
                }
                // TODO -cFramework -oNoel : push the refresh back into the buttons collection. 
                // Note: may need to wrap each method (Restore, Maximize, Close) in a custom method that 
                // includes refresh and override the default methods with these versions.
                pane.Buttons.Restore.refresh(); 
                if (pane.Buttons.Restore.Visible){
                    pane.Buttons.Restore.click(); 
                }                
                pane.log(); 
            }  
        }
    }).run();
}