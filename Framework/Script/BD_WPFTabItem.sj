//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFClickable

/**
 * Contains object that encapsulates a Microsoft TabItem
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTabItem = WPFClickable.extend({
    FrameworkClassName: "WPFTabItem",
    ErrorType: WPFTabItemError, 
    AllowedClassNames: ["System.Windows.Controls.TabItem"]
})