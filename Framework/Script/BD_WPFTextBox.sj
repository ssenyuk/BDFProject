//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement

/**
 * Contains object that encapsulates a WPF text box
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTextBox = WPFElement.extend({
    FrameworkClassName: "WPFTextBox",
    ErrorType: WPFTextBoxError,
    AllowedClassNames: ["System.Windows.Controls.TextBox"],
    
    init: function (options) {
        this._super(options);
        
        if (this.propertyExists("wText")){
            this.Text = this.TCObject.wText;
        } else {
           this.error(ErrorMessages.OptionExpectedError, "TCObject.wText"); 
        }
    },
    
    text: function (value) {
        // reflect the latest wText property value
        this.TCObject.Refresh();        
        if (this.propertyExists("wText")){  
            if (value) {
                this.TCObject.wText = value;
                
                // make sure the text is set to the value before moving on
                if (this.TCObject.WaitProperty("wText", value, 
                    this.App.Settings.Timeouts.Settings.Short.Value)){}
            } else {
                return this.TCObject.wText;
            }
        } else {
            this.error(ErrorMessages.PropertyNotFound, "wText"); 
        }
    }
})