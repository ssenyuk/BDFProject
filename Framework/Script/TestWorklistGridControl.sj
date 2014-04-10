//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Worklist workspace. Verify that at least one worklist instance exists." +
            "Open a worklist and manually add worklist entries from the Tasks pane to the Worklist Entries grid.",
        TestFunction: function(window){
            window.Finder.findAll({
                Params: { Window: window },
                ClrClassName : "WorklistGridControl",
                Duration: 15000,
                Depth: 100,
                OnCompleted: function(e){
                    var grid = e.Result[0].cast(WPFWorklistGridControl);
                    
                    //a) getNonEmptyRows();
                    var rows = grid.Rows; // all rows are non-empty by default.
                    rows.log(); 
                    
                    // b) getLastRow()
                    grid.getFirstRow().log(); 
                    grid.getLastRow().log();
                    
                    // c) expandAllRows()expandRow( rowNumberToExpand)
                    grid.expandAll(); 
                    
                    // d) collapseWorklistEntry(( rowNumberToCollapse)                    
                    grid.collapseAll(); 
                    
                    //e) getParentRows()
                    grid.ParentRows.log(); 
                    
                    //f) waitForRowCount(expected, timeout): Description: Waits until 
                    //   number of rows in the worklist grid matches expected value
                    grid.wait({
                        Params: { Grid: grid },
                        Description: "More than three grid rows",
                        WaitFunction: function(e){
                            e.Done = e.Params.Grid.Rows.Count > 3;     
                        },
                        OnCompleted: function(e){
                            Log.Message("Grid now has " + e.Params.Grid.Rows.Count.toString() + " rows.") ;
                        }
                    }); 
                    
                    // g) getCellFromRow(rowRef, colName): Description:  Gets a reference a cell from a grid row
                    var row = grid.Rows.Items[2]; 
                    var taskCell = row.Cells.Items.Task; 
                    taskCell.log(); 
                    
                    // h) openContextMenuForRow (workItemNumber): Description:  Opens a context menu for a specified work item
                    grid.openContextMenu(0);
                    e.Params.Window.App
                        .waitForWindow({Text: "Assign Keywords to Entry"})
                        .close();  

                        
                    // i)  getInfoGridFromRow(rowRef) ?                       
                }   
            });
        }
    }).run(); 
}