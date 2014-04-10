//USEUNIT BD_WPFCheckable
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates a WPF clickable element
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFRadioButton = WPFCheckable.extend({
    FrameworkClassName: "WPFRadioButton",
    ErrorType: WPFRadioButtonError,
    AllowedClassNames: ["System.Windows.Controls.RadioButton"],    
    GroupName: "",
    
    init: function(options){
        this._super(options);
        this.GroupName = this.TCObject.GroupName; 
    }
})