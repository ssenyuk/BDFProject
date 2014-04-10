//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to a FACSuite experiment so that " +
            "the Cytometer pane is visible and showing numeric updownslider controls",
        TestFunction: function(window){
            var controls = window
                .Finder
                .findAll({ClrClassName: "NumericUpDownSlider", VisibleOnScreen: true, Enabled: true, Depth: 50}); 
           
            if (controls && controls.length > 0){
                // change any of the up-down controls that are visible and enabled
                for(var prop in controls){
                    var updown = controls[prop].cast(WPFNumericUpDownSlider); 
                    if (updown.Enabled && updown.Visible){
                        updown.log();
                        updown.increment(); 
                        updown.increment();
                        updown.log();                   
                    }
                }
            } else {
                this.error("Enabled and visible NumericUpDownSliders on screen were not found"); 
            }     
        }
    }).run(); 
}