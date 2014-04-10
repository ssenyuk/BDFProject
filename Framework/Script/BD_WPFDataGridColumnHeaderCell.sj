//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_Element

/**
 * Contains object that encapsulates a grid column heading cell
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFDataGridColumnHeaderCell = WPFElement.extend({
    FrameworkClassName: "WPFDataGridColumnHeaderCell",
    ErrorType: WPFDataGridColumnHeaderCellError, 
    TextBlocks: null,
    
    init: function(options){
        
        this._super(options);

        if (this.TCObject && 
            this.TCObject.ChildCount &&
            this.TCObject.ChildCount > 0) {
            this.Text = this.TCObject.Child(0).Text;
        }
    }
})