//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){
    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Setup & QC workspace, select QC Tracking tab. " +
            "Manually verify that there are charts showing in the listbox.",
        TestFunction: function(window){
            var listBox = window
                .Finder
                .find({NativeClrObject: "SetupLJChartsListBox", Depth: 40})
                .cast(Element); 
             
            var items = listBox
                .Finder
                .findAll({ClrClassName : "ListBoxItem", Depth: 10});
        
            if (items.length > 0){
                var item = items[items.length - 1].cast(Element);  
                var chart = item.cast(LJChart);
                chart.log();
                chart.ChartButtons.click({Name: "SetupQCTrackingZoomButton"}); 
                chart.ChartButtons.click({Name: "SetupQCTrackingCopyButton"});
            } else {
                this.error("Charts were not found in the ListBox.");
            }        
        }
    }).run(); 
}