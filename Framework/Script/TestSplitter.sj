//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){
    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Setup & QC workspace | Setup & QC tab.",
        TestFunction: function(window){
            var element = window
                .Finder
                .find({ClrClassName : "SetupAndQCView", Depth: 40}); 
            
            if (element){
                var workspace = element.cast(Element);
            } else {
                this.error("SetupAndQCView workspace not found"); 
                return; 
            }                
                
            var splitters = workspace
                .Finder
                .findAll({ClrClassName : "WorkspaceSplitter", Depth: 40});

            if (splitters && splitters.length > 0){
                for(var prop in splitters){
                    var splitter = splitters[prop].cast(WPFWorkspaceSplitter);
                    splitter.log();  
                    if (splitter.Visible){
                        if (splitter.Orientation == "Horizontal"){
                            splitter.position({Top: -40}); 
                        }
                        if (splitter.Orientation == "Vertical"){
                            splitter.position({Left: -40}); 
                        }                
                    }
                    splitter.log(); 
                }
            } else {
                this.error("WorkspaceSplitters not found"); 
            }
        }
    }).run();
}