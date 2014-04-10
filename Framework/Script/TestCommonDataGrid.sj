//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Library workspace. " +
            "In the Library treeview select Assays | User-Defined.",
        TestFunction: function(window){
           var element = window
                .Finder
                .find({NativeClrObject: "AssayListCommonDataGrid", Depth: 40}); 
        
            if (element){
                var grid = element.cast(WPFCommonDataGrid);
                grid.log(); 
            } else {
                this.error("Grid not found.");          
            }
        }
    }).run(); 
}