//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_ViewModel

/**
 * Contains object that encapsulates a Microsoft data visualization chart
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFChart = WPFElement.extend({
    FrameworkClassName: "WPFChart",
    ErrorType: WPFChartError,
    AllowedClassNames: ["System.Windows.Controls.DataVisualization.Charting.Chart"],
    DataContext: null,
    ViewModelType: ViewModel, 
    
    init: function(options){
        this._super(options);
        
        if (this.TCObject.Title){
            this["Text"] = this.TCObject.Title.OleValue
        }
        
        if (this.TCObject.DataContext){
            this.DataContext = new this.ViewModelType({
                App: this.App,
                TCObject: this.TCObject.DataContext
            });                
        }
    },
    
    logContents: function(){
        this._super();
        
        this.logPicture(); 
        
        if (this.DataContext){
            Log.AppendFolder("DataContext");
            try {
                this.DataContext.logContents();             
            } finally {
                Log.PopLogFolder(); 
            }        
        }
    }
})