//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "Preferences",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Tools | Preferences | Worklists.",
        TestFunction: function(window){
            var controls = window
                .Finder
                .findAll({ClrClassName: "NumericUpDown"}); 
           
            if (controls && controls.length > 0){
                var updown = controls[0].cast(WPFNumericUpDown);
                updown.log();
                updown.increment(); 
                updown.increment();
                updown.log();                 
            } else {
                this.error("NumericUpDown not found"); 
            }     
        }
    }).run(); 
}