//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Setup & QC workspace | Configurations tab. " +
            "Close at least one WorkspacePane to display a PaneButton in the UI.",
        TestFunction: function(window){
            var workspace = window
                .Finder
                .find({
                    ClrClassName : "Workspace", 
                    Depth: 40
                })
                .cast(Element);
            
            var buttons = window
                .Finder
                .findAll({
                    ClrClassName : "PaneButton",  
                    Visible: true, 
                    Depth: 40
                });
                
            if (buttons.length > 0){
                for(var prop in buttons){
                    var button = buttons[prop]
                        .cast(WPFPaneButton); 
                    if (button.Visible){
                        button.click()
                    }
                    button.log(); 
                }
            } else {
                this.error("No visible pane buttons were found"); 
            }
        }
    }).run();
}