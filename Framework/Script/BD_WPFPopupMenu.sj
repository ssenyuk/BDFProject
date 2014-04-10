//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element

/**
 * Contains object that encapsulates a context menu.
 *
 * Note: The ContextMenu TCObject is very minimal, without ClrClassName and ClrFullClassName.
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFPopupMenu = TestCompleteBase.extend({
    ErrorType: WPFPopupMenuError, 
    FrameworkClassName: "WPFPopupMenu",
    Parent: null,
  
    init: function(options){
        this._super(options); 
        this.validateInitOptions(["Parent"]);
    },
    
    show: function(){
        if (this.Parent){
            this.Parent.rightClick();
        }
        return this;  
    },
    
    click: function (options) {
        if (options && options.Path){
            this.TCObject.Click(options.Path);     
        }
        return this;
    },
    
    close: function (options) {
        this.TCObject.Close;     
        return this;
    }    
})