//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement

/**
 * Contains object that encapsulates a WPF TextBlock
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTextBlock = WPFElement.extend({
    FrameworkClassName: "WPFTextBlock",
    ErrorType: WPFTextBlockError,
    AllowedClassNames: ["System.Windows.Controls.TextBlock"],
    
    refresh: function(){
        if (this._super){
            this._super(); 
        }
        
        if (this.TCObject.Text){
            this.Text = this.TCObject.Text.OleValue; 
        }
    },
    
    getText: function(){
        return this.TCObject.Text.OleValue != undefined ? this.TCObject.Text.OleValue : ""; 
    },
    
    setText: function(text){
        this.TCObject.Text.OleValue = text;
    },
    
    log: function(){
        var hasText = this.Text != undefined && this.Text != "";
        
        var text = " \"" + this.Text + "\"";
        Log.Message(this.ClrClassName + text);        
    }
})