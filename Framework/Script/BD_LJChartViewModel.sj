//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Base
//USEUNIT BD_ViewModel

/**
 * Contains object that encapsulates a LJChartViewModel
 * @author Noel Rice
 * @company Falafel Software
 */

var LJChartViewModel = ViewModel.extend({
    FrameworkClassName: "LJChartViewModel",
    ErrorType: LJChartViewModelError,
    AllowedClassNames: ["BD.FACSuite.InstrumentsModule.Tracking.Views.LJChartViewModel"],
    ChartData: [], 
    
    init: function(options){
        this._super(options);
        
        if (this.TCObject.ChartData){
        
            for(var i = 0; i < this.TCObject.ChartData.Count; i++){
                var item = new TestCompleteBase({
                    App: this.App,
                    TCObject: this.TCObject.ChartData.Item(i)
                });  
                // copy TCObject properties to the item
                item.copyProperties();
                item["Name"] = "Data Point";  
                this.ChartData.push(item);             
            }
        }    
    },
    
    logContents: function(){
        this._super(); 
        
        Log.AppendFolder("ChartData (" + this.ChartData.length + ")");
        try {
            for(var prop in this.ChartData){
                this.ChartData[prop].log();                         
            }
        } finally {
            Log.PopLogFolder(); 
        }
    }
})