//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Library workspace",
        TestFunction: function(window){
            var element = window
                .Finder
                .find({NativeClrObject : "LibraryBrowserTreeView", Depth: 40}); 
            var treeView = element
                .cast(WPFTreeView); 
            
            treeView.log(); 
        
            var labels = treeView.item({Text: "Labels"}); 
            labels.click(); 
                         
            treeView
                .item({Text: "Tube Settings"})
                .expand()
                .item({Text: "User-Defined"})
                .click(); 
        }
    }).run();
}