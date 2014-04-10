//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "Preferences",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Tools | Preferences | Worklists.",
        TestFunction: function(window){
            var checkboxes = window
                .Finder
                .findAll({ClrClassName: "Checkbox"});
                
            if (checkboxes.length && checkboxes.length > 0) {
                var checkbox = checkboxes[0].cast(WPFCheckbox);
                checkbox.uncheck(); 
                checkbox.log(); 
            } else {
                this.error("No checkboxes found.");  
            }
        }
    }).run(); 
}