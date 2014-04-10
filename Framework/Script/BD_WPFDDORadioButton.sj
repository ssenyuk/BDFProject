//USEUNIT BD_WPFCheckable
//USEUNIT BD_WPFClickable
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates a WPF clickable element
 * @author Neda Sayan
 * @company BD Biosciences
 * @Date: 1/22/2014
 */

var WPFDDORadioButton = WPFClickable.extend({
    FrameworkClassName: "WPFDDORadioButton",
    ErrorType: WPFDDORadioButtonError,
    AllowedClassNames: ["BD.FACSuite.CustomControls.DDORadioButton"],    
    GroupName: "",
    
    init: function(options){
        this._super(options);
        this.GroupName = this.TCObject.GroupName; 
    }
})