//USEUNIT BD_WPFClickableCollection
//USEUNIT BD_WPFWorksheetTabItem
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates a series of clickable tab elements in worksheet
 *
 * @author Neda Sayan
 * @company BD Biosciences
 * @Date: 1/25/2014
 */

var WPFWorksheetTabControl = WPFClickableCollection.extend({
    ErrorType: WPFWorksheetTabControlError,
    FrameworkClassName: "WPFWorksheetTabControl",
    AllowedClassNames: ["System.Windows.Controls.TabControl"],
    ItemClrClassName: "WorksheetTabItem",
    ItemDepth: 15,
    ItemType: WPFWorksheetTabItem
    
})