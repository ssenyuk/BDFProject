//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFActionable
//USEUNIT BD_Action
//USEUNIT BD_Utils

/**
 * Contains object that encapsulates an Xceed split button item
 * @author Noel Rice
 * @company Falafel Software
 */
 
var WPFXceedSplitButtonItem = WPFActionable.extend({
    FrameworkClassName: "WPFXceedSplitButtonItem",
    ErrorType: WPFXceedSplitButtonItemError,
    Actions:{
        "click": new Action({ValidStates: { "Enabled": true }})        
    },
    Enabled: false,
    
    init: function (options) {
        this._super(options);

        this.Text = this.TCObject.WPFControlText; 
        this.Name = new BDUtils().textToName(this.Text);
        this.Enabled = this.TCObject.IsEnabled; 
    },
    
    click: function(){
        if (this.IsValidAction(this.Actions.click)){
            this.TCObject.ClickItem(); 
        }
        return this; 
    }
})