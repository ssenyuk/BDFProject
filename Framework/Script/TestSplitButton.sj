//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "First run the FACSimulator application. " + 
            "Then navigate manually to FACSuite Worklist and open a worklist. " + 
            "The RunAll button should visible and enabled before proceeding",
        TestFunction: function(window){
            var element = window
                .Finder
                .find({NativeClrObject: "RunWorklistSplitButton", Depth: 50});
                
            if (element) {
                var button = element.cast(WPFXceedSplitButton);
                button.open(); 
                button.Items.RunAll.click();  
                button.close(); 
                button.log();
                aqUtils.Delay(2000);  
            } else {
                this.error("RunWorklistSplitButton not found.");  
            }
        }
    }).run(); 
}