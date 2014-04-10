//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Setup & QC workspace | Set & QC",
        TestFunction: function(window){
            var element = window
                .Finder
                .find({NativeClrObject: "CytometerHeaderStatusExpander",
                Depth: 30});
                
            if (element) {
                var expander = element.cast(WPFExpander);
                expander.expand(); 
                expander.log(); 
                Delay(500);
                expander.collapse(); 
                expander.log(); 
            } else {
                this.error("CytometerHeaderStatusExpander not found.");  
            }
        }
    }).run(); 
}