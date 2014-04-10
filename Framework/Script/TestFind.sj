//USEUNIT BD_UnitTest
//USEUNIT BD_WPFClickable

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite so that the side navigation bar buttons are available.",
        TestFunction: function(window){
            var finder = new Finder({ App: window.App, TCObject: window.TCObject });
            var navIconStrip = finder
                .find({NativeClrObject: "WorkspaceNavigationItemsControl"})
                .cast(Element);
            if (navIconStrip){
                Log.Message("Found navIconStrip"); 
            } else {
                Log.Error("Could not find navIconStrip"); 
            }
        }
    }).run(); 
}