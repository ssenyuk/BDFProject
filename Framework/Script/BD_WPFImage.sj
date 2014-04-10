//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement

/**
 * Contains object that encapsulates a WPF image 
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFImage = WPFElement.extend({
    FrameworkClassName: "WPFImage",
    ErrorType: WPFImageError, 
    AllowedClassNames: ["System.Windows.Controls.Image"],

    log: function(){
        this.TCObject.BringIntoView(); 
        Log.Picture(this.TCObject.Picture(), "Onscreen image")
    }
})