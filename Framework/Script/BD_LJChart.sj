//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFChart
//USEUNIT BD_LJChartButtons
//USEUNIT BD_LJChartViewModel

/**
 * Contains object that encapsulates a custom LJ chart
 * @author Noel Rice
 * @company Falafel Software
 */

var LJChart = WPFElement.extend({
    FrameworkClassName: "LJChart",
    ErrorType: LJChartError,
    Chart: null,  
    ChartButtons: null,
    
    init: function(options){
        this._super(options);
                
        this.Mapper.map([
            { Name: "Chart", ClrClassName: "Chart", ClassType: WPFChart, Depth: 10, Options: {ViewModelType: LJChartViewModel}},
            { Name: "ChartButtons", NativeClrObject: "ChartButtons", ClassType: LJChartButtons, Depth: 10 }
        ]);                
    },
    
    logStart: function(){
        Log.AppendFolder(this.Chart.ClrClassName);
    },
    
    logContents: function(){
        this.Chart.logContents();
        this.ChartButtons.log(); 
    }
});