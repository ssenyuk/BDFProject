//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){
    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to Setup & QC | QC Reports tab. Click the 'Two Pages' button on" +
            " the toolbar to show two pages at once.",
        TestFunction: function(window){
            var element = window
                .Finder
                .find({ClrClassName: "DocumentGrid", Depth: 40});
            
            if (element){
                var report = element.cast(WPFCytometerReport);
                report.log();
                if (report.Pages.length < 2){
                    this.error("Both pages of the report were not showing"); 
                } 
            } else { 
                this.error("DocumentGrid not found"); 
            }        
        }
    }).run();
}