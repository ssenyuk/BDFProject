//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFTextBox

/**
 * Contains object that encapsulates a WPF text box
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFPasswordBox = WPFTextBox.extend({
    FrameworkClassName: "WPFPasswordBox",
    ErrorType: WPFPasswordBoxError,
    AllowedClassNames: ["System.Windows.Controls.PasswordBox"]
})