//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to the experiments view and open an experiment. Make sure the experiment has " +
        "a statistics grid.",
        TestFunction: function(window){
            window.Finder.findAll({
                Params: { Window: window },
                ClrClassName : "StatsControl",
                Duration: 15000,
                Depth: 100,
                OnCompleted: function(e){
                    var grid = e.Result[0].cast(WPFStatsControl);
                    
                    //a) getNonEmptyRows();
                    var rows = grid.Rows; // all rows are non-empty by default.
                    rows.log(); 
                    
                    // b) getLastRow()
                    grid.getFirstRow().log(); 
                    grid.getLastRow().log();
                                        
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
                    var nameCell = row.Cells.Items.Name; 
                    nameCell.log(); 
                },
                OnTimedOut: function(e){
                    window.error("Unable to find StatsControl"); 
                }   
            });
        }
    }).run(); 
}