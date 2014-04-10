//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){
    new UnitTest({
        ExpectedWindowName: "Preferences",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to Tools | Preferences | Worklists.",
        TestFunction: function(window){
            var controls = window
                .Finder
                .findAll({ClrClassName: "RadioButton", Depth: 50}); 
           
            if (controls && controls.length > 0){
                // change any of the up-down controls that are visible and enabled
                for(var prop in controls){
                    var control = controls[prop].cast(WPFRadioButton); 
                    if (control.Enabled && control.Visible){
                        control.log(); 
                        control.check(); 
                        control.log();                   
                    }
                }
            } else {
                this.error("RadioButtons not found"); 
            }     
        }
    }).run();
}