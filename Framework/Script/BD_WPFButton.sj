//USEUNIT BD_WPFClickable
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Action

/**
 * Contains object that encapsulates a WPF button
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFButton = WPFClickable.extend({
    FrameworkClassName: "WPFButton",
    ErrorType: WPFButtonError,
    AllowedClassNames: ["System.Windows.Controls.Button",
    "System.Windows.Controls.Label"]
})
