//USEUNIT BD_UnitTest
//USEUNIT BD_WPFClickable

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite so that the side navigation bar buttons are available.",
        TestFunction: function(window){
            var finder = new Finder({ App: window.App, TCObject: window.TCObject });
            var navIconStrip = finder.find({
                NativeClrObject: "WorkspaceNavigationItemsControl",
                OnCompleted: function(e){
                    var navStrip = e.Result.cast(Element); 
                    var navIcons = navStrip.Finder.findAll({
                        ClrClassName: "NavIcon", 
                        Duration: 1,
                        OnCompleted: function(e){
                            for(var prop in e.Result){
                                var icon = e.Result[prop].cast(WPFClickable); 
                                icon.click(); 
                            }
                        },
                        OnTimedOut: function(e){
                            e.Subscriber.error("Timed out while finding nav icons"); 
                        }   
                    });                        
                }  
            })
        }
    }).run(); 
}