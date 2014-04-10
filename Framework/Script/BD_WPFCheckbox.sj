/**
 * Contains object that encapsulates a WPF clickable element
 * @author Noel Rice
 * @company Falafel Software
 */

//USEUNIT BD_WPFCheckable
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

var WPFCheckbox = WPFCheckable.extend({
    FrameworkClassName: "WPFCheckbox", 
    ErrorType: WPFCheckboxError,
    AllowedClassNames: ["System.Windows.Controls.CheckBox"]
})