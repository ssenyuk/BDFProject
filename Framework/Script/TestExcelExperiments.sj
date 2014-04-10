//USEUNIT BD_Excel

/**
 * contains usage examples for the Excel object
 * @author Noel Rice
 * @company Falafel Software
 */

function logExperimentsByOwner(owner){
    // log experiments for a specific owner
    var excel = new Excel({
        FilePath: "C:\\Data\\Experiments.xlsx",
        SheetName: "Sheet1",
        OnRow: function(e){
            if (e.Row.Columns["Owner"] == owner){
                Log.Message("Experiment Name: " + e.Row.Columns["Name"] + 
                    " Date: " + e.Row.Columns["Date"]);
            }
        }
    });
    excel.read();
}

function test() {
    logExperimentsByOwner("10002");     
}