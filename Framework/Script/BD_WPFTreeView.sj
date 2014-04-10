//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFHierarchyBase
//USEUNIT BD_WPFTreeViewItem

/**
 * Contains object that encapsulates a standard Microsoft WPF TreeView control
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTreeView = WPFHierarchyBase.extend({
    FrameworkClassName: "WPFTreeView",
    ErrorType: WPFTreeViewError,
    AllowedClassNames: ["System.Windows.Controls.TreeView"],
    ItemClrClassName:"TreeViewItem",
    ItemType: WPFTreeViewItem
})