//USEUNIT BD_Excel

/**
 * contains usage examples for the Excel object 
 * @author Noel Rice
 * @company Falafel Software
 */

var ExperimentsSpreadsheet = Excel.extend({
    init: function(options){
        this._super(options);                 
    },
    
    readExperimentsByOwner: function(owner){
        this.OnRow = this.subscribe("OnRow", function(e){
            if (e.Row.Columns["Owner"] == owner){
                Log.Message("Experiment Name: " + e.Row.Columns["Name"] + 
                    " Date: " + e.Row.Columns["Date"]);
            }
        });
        this.read();          
    }
}); 

function test (){
    var excel = new ExperimentsSpreadsheet({
        FilePath: "C:\\Data\\Experiments.xlsx",
        SheetName: "Sheet1"
    });
    excel.readExperimentsByOwner("10002");
}