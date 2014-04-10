//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element
//USEUNIT BD_WPFPopupMenu

/**
 * Contains object that encapsulates an on-screen WPF visual element. 
 * This object introduces the PopupMenu and a right-click to invoke the popup.
 * This object also uses WPFControl for the Text property content.
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFElement = Element.extend({
    FrameworkClassName: "WPFElement",
    ErrorType: WPFElementError,
    PopupMenu: null,

    init: function (options) {
        this._super(options);
                        
        if (this.TCObject.ContextMenu){
            this.PopupMenu = new WPFPopupMenu({
                App: this.App,
                TCObject: this.TCObject.PopupMenu,
                Parent: this
            }); 
        }
    },
   
    refresh: function () {
        if (this._super){
            this._super(); 
        }

        if (this.propertyExists("WPFControlText")) {
            if (this.TCObject.WPFControlText != ""){
                this["Text"] = this.TCObject.WPFControlText;
            }
        }
            
        return this;
    },
    
    rightClick: function(){
        if (this.Exists){
            this.TCObject.ClickR();
            return this; 
        } 
    }
});