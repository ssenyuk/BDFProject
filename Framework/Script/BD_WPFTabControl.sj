//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFClickableCollection
//USEUNIT BD_WPFTabItem

/**
 * Contains object that encapsulates a Microsoft TabControl
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTabControl = WPFClickableCollection.extend({
    FrameworkClassName: "WPFTabControl",
    ErrorType: WPFTabControlError, 
    AllowedClassNames: [
        "System.Windows.Controls.TabControl",
        "BD.FACSuite.UIInfrastructure.SortedItemsControl"
    ],
    ItemClrClassName: "TabItem",
    ItemDepth: 10,
    ItemType: WPFTabItem
})