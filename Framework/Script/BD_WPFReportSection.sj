//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFTextBlock

/**
 * Contains object that encapsulates an area in a Microsoft FixedPage.
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFReportSection = WPFElement.extend({
    FrameworkClassName: "WPFReportSection", 
    ErrorType: WPFReportSectionError, 
    Items: [], 
    
    init: function(options){
        this._super(options);
        
        this.Items = []; 
        
        this.Mapper.map([
            { Name: "Items", ClrClassName: "TextBlock", ClassType: WPFTextBlock, Visible: true, IsCollection: true, Depth: 20 }
        ]);    
    },
    
    logContents: function(){
        for(var prop in this.Items){
            var item = this.Items[prop]; 
            item.log(); 
        }
    }        
})