//USEUNIT BD_WPFClickableCollection
//USEUNIT BD_WPFWorkspaceTabItem
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates a series of clickable tab elements
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFWorkspaceTabControl = WPFClickableCollection.extend({
    ErrorType: WPFWorkspaceTabControlError,
    FrameworkClassName: "WPFWorkspaceTabControl",
    AllowedClassNames: ["BD.FACSuite.CustomControls.WorkspaceTabControl"],
    ItemClrClassName: "WorkspaceTabItem",
    ItemDepth: 10,
    ItemType: WPFWorkspaceTabItem
})