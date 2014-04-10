//USEUNIT BD_WPFClickableCollection
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFButton

/**
 * Contains object that encapsulates buttons for an LJ chart
 * @author Noel Rice
 * @company Falafel Software
 */

var LJChartButtons = WPFClickableCollection.extend({
    FrameworkClassName: "LJChartButtons",
    ErrorType: LJChartButtonsError,
    ItemClrClassName: "Button",
    ItemDepth: 20,
    ItemType: WPFButton,
    Name: "ChartButtons", 
    
    init: function(options) {
        this._super(options); 
    }
})