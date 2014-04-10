//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFActionable

/**
 * Contains object that encapsulates a WPF clickable element
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFClickable = WPFActionable.extend({
    FrameworkClassName: "WPFClickable",
    ErrorType: WPFClickableError,  
    Actions:{
        "click": new Action({ValidStates: { "Enabled": true, "Visible": true }}),
        "doubleClick": new Action({ValidStates: { "Enabled": true, "Visible": true }})
    },
    
    click: function(){
        if (this.IsValidAction(this.Actions.click)){
            this.TCObject.Click();
        }
    },
    
    doubleClick: function(){
        if (this.IsValidAction(this.Actions.doubleClick)){
            this.TCObject.DoubleClick();
        }
    },
        
    // override
    getText: function(){
        return this.propertyExists("WPFControlText") ? 
            this.TCObject.WPFControlText : ""; 
    }
})