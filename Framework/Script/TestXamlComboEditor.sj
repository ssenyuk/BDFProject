//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Worklist workspace. " +
            "Add worklist entries from the Tasks pane to the Worklist Entries grid.",
        TestFunction: function(window){
            var combos = window
                .Finder
                .findAll({ClrClassName : "XamComboEditor", Depth: 40});
                
            if (combos && combos.length > 0){
                for(var prop in combos){
                    var combo = combos[prop].cast(XamComboEditor);
                    combo.log(); 
                }
                var combo = combos[0].cast(XamComboEditor);     
                combo.setIndex({Index: 0}); 
                combo.log();            
            } else {
                this.error("No XamComboEditors found"); 
            } 
        }
    }).run();
}