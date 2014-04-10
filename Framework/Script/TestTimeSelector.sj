//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){
    new UnitTest({
        ExpectedWindowName: "Preferences",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to Tools | Preferences | System | Hardware.",
        TestFunction: function(window){
            var checkBoxPreprogrammedStartup = window
                .Finder
                .find({NativeClrObject: "EnableDisablePreProgramStartUpCheckBox", Depth: 40}); 
                
            if (checkBoxPreprogrammedStartup) {
                checkBoxPreprogrammedStartup
                    .cast(WPFCheckbox)
                    .check(); 
            } else {
                this.error("EnableDisablePreProgramStartUpCheckBox not found");
                return; 
            }
            
            var checkBoxMonday = window
                .Finder
                .find({NativeClrObject: "EnableDisableMondayScheduleTimeCheckBox", Depth: 40});
                
            if (checkBoxMonday){
                checkBoxMonday
                    .cast(WPFCheckbox)
                    .check(); 
            } else {
                this.error("EnableDisableMondayScheduleTimeCheckBox not found");
                return;  
            }
            
            var selector = window
                .Finder
                .find({NativeClrObject: "SelectMondayStartUpTimePicker", Depth: 40}); 
            
            if (selector) {
                selector
                    .cast(WPFTimeSelector)
                    .setTimeByListIndex({Index: 3})
                    .log(); 
            } else {
                this.error("SelectMondayStartUpTimePicker not found");
                return; 
            }
        }
    }).run();
}