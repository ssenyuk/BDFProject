//USEUNIT BD_WPFElement
//USEUNIT BD_WPFTextBlock
//USEUNIT BD_WPFImage
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

// describes a charting control as implemented in experiments/statistics
var WPFPlotControl = WPFElement.extend({
    FrameworkClassName: "WPFPlotControl",
    ErrorType: WPFPlotControlError,
    AllowedClassNames: ["BD.WPFPlots.PlotControl"],
    Title: null,
    ChartImage: null,
    TextBlocks: null,
    
    init: function(options){
        this._super(options);
        
        this.Mapper.map([
           // { Name: "ChartImage", ClrClassName: "Image", ClassType: WPFImage, Depth: 5 },
            { Name: "TextBlocks", ClrClassName: "TextBlock", Visible: true, ClassType: WPFTextBlock, IsCollection: true, Depth: 5 }
        ]);
        
        for(var prop in this.TextBlocks){
            var textBlock = this.TextBlocks[prop]; 
            if (textBlock.Name == ""){
                this.Title = textBlock.Text; 
            } else if (textBlock.Text != ""){
                this[textBlock.Name] = textBlock.Text;    
            }
        }
    },
    
    logContents: function(){
        this._super(); 
        this.ChartImage = this.Finder.find({ClrClassName: "Image", Depth: 5 }).cast(WPFImage);
        if (this.ChartImage){
            this.ChartImage.log(); 
        }
    }
})