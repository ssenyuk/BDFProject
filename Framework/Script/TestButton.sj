//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite so that the side navigation bar buttons are available.",
        TestFunction:  function(window){
            var element = window
                .Finder
                .find({NativeClrObject: "OpenUserProfileButton"});
                
            if (element) {
                var button = element.cast(WPFButton);
                button.click(); 
                button.log(); 
            } else {
                this.error("OpenUserProfileButton not found.");  
            }
        }
    }).run(); 
}