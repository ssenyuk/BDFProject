//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFClickable
//USEUNIT BD_WPFElement

/**
 * Contains object that encapsulates the expander control (+/- icon) of a TreeList control
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTreeListRowExpander = WPFClickable.extend({
    FrameworkClassName: "WPFTreeListRowExpander",
    ErrorType: WPFTreeListRowExpanderError,
    AllowedClassNames: ["BD.FACSuite.CustomControls.TreeListRowExpander"]
})