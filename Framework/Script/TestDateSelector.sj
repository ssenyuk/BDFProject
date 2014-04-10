//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Setup & QC | QC Tracking tab.",
        TestFunction: function(window){
            var filterRadioButtonAll = window
                .Finder
                .find({NativeClrObject: "SetupLJFromRadioButton", Depth: 60}); 
                
            if (filterRadioButtonAll){
                filterRadioButtonAll
                    .cast(WPFRadioButton)
                    .check();
            } else {
                this.error("RadioButton 'SetupLJFromRadioButton' not found"); 
            }
         
            var picker = window
                .Finder
                .find({NativeClrObject: "SetupLJToDatePickerXT", Depth: 60});  
                
            if (picker){
                picker = picker.cast(WPFDatePicker); 
                picker.setDateString({Date: "9/22/2013"}); 
                picker.log(); 
           } else {
                this.error("DatePicker 'SetupLJToDatePickerXT' not found"); 
           }
        }
    }).run(); 
}