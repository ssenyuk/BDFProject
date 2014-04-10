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
                .find({
                    NativeClrObject: "WorkspaceNavigationItemsControl"
                    })
                .cast(Element);
             
            var navIcons = navIconStrip.Finder.findAll({ClrClassName: "NavIcon", Depth: 2});
            if (navIcons && navIcons.length > 0){
                for(var prop in navIcons){
                    var icon = navIcons[prop].cast(WPFClickable); 
                    icon.click(); 
                }
            }
        }
    }).run(); 
}