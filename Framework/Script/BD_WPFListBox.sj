//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFItemsControl

/**
 * Contains object that encapsulates a WPF ListBox
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFListBox = WPFItemsControl.extend({
    FrameworkClassName: "WPFListBox",
    ErrorType: WPFListBoxError,
    AllowedClassNames: ["System.Windows.Controls.ListBox"],
    
    // override to get header text
    getItemText: function(item){
        return item.Content != undefined ? item.Content : "";          
    }    
})