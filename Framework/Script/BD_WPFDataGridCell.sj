//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_Element

/**
 * Contains object that encapsulates a single grid cell
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFDataGridCell = WPFElement.extend({
    FrameworkClassName: "WPFDataGridCell",
    ErrorType: WPFDataGridCellError, 
    AllowedClassNames: ["Microsoft.Windows.Controls.DataGridCell"],
    TextBlocks: null,
    
    init: function(options){
        var lines = []; 
        
        this._super(options);
        
        this.Mapper.map([
            { Name: "TextBlocks", ClrClassName: "TextBlock", IsCollection: true, ClassType: Element, Depth: 10 }
        ]);
        
        for(var prop in this.TextBlocks){
            var textBlock = this.TextBlocks[prop]; 
            lines.push(textBlock.TCObject.WPFControlText);     
        }
        this.Text = lines.join(); 
    }
})