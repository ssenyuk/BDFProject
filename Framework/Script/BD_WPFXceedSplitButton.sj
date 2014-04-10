//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFXceedSplitButtonItem
//USEUNIT BD_WPFElement
//USEUNIT BD_Utils

/**
 * Contains object that encapsulates an Xceed WPF split button
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFXceedSplitButton = WPFElement.extend({
    FrameworkClassName: "WPFXceedSplitButton",
    ErrorType: WPFXceedSplitButtonError, 
    AllowedClassNames: ["Xceed.Wpf.Toolkit.SplitButton"],
    Items: {},
    
    refresh: function(){
        var content = this.TCObject.DropDownContent; 
        if (content && content.Children){        
            for(var i = 0; i < content.Children.Count; i++){
                var child = content.Children.Item(i); 
                var name = new BDUtils().textToName(child.WPFControlText); 
                this.Items[name] = new WPFXceedSplitButtonItem({
                    App: this.App,
                    TCObject: child,
                    Name: name,
                    Text: child.WPFControlText
                }); 
            }
        }    
    },
    
    open: function(){
        this.TCObject.IsOpen = true; 
    },
    
    close: function(){
        this.TCObject.IsOpen = false; 
    }
})