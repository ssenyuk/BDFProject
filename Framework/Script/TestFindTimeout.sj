//USEUNIT BD_UnitTest
//USEUNIT BD_WPFClickable

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite so that the side navigation bar buttons are available.",
        TestFunction: function(window){
            var finder = new Finder({ App: window.App, TCObject: window.TCObject });

            var navIcons = finder.find({
                NativeClrObject: "WorkspaceNavigationItemsControl", 
                Duration: 5000,
                OnTimedOut: function(e){
                    e.Subscriber.error("Timed out while finding nav strip"); 
                },
                OnCompleted: function(e){
                    Log.Message("Found nav strip"); 
                }
            });
        }
    }).run(); 
}