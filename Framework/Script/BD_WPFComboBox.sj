//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFItemsControl

/**
 * Contains object that encapsulates a WPF drop down combobox
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFComboBox = WPFItemsControl.extend({
    FrameworkClassName: "WPFComboBox",
    ErrorType: WPFComboBoxError,
    AllowedClassNames: ["System.Windows.Controls.ComboBox"],

    open: function(){
        this.TCObject.DropDown(); 
        return this;   
    },
    
    close: function(){  
        this.TCObject.CloseUp(); 
        return this;   
    },
    
    // override to get header text
    getItemText: function(item){
        return item.Content != undefined ? item.Content : "";          
    }
})