//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test() {
    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite. The main menu should be available",
        TestFunction: function (window) {
            var element = window
                .Finder
                .find({
                    NativeClrObject: "MainMenu",
                    Depth: 50
                });

            if (element) {
                element
                    .cast(WPFMenu)
                    .log()
                    .Items.Help.click()
                    .Items.AboutFACSuite.click(); 
            } else {
                this.error("MainMenu not found.");
            }
        }
    }).run();
}