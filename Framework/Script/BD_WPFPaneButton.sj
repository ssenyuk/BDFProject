//USEUNIT BD_WPFClickable
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates a custom PaneButton
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFPaneButton = WPFClickable.extend({
    FrameworkClassName: "WPFPaneButton",
    ErrorType: WPFPaneButtonError, 
    AllowedClassNames: ["BD.FACSuite.CustomControls.Panels.PaneButton"]
})