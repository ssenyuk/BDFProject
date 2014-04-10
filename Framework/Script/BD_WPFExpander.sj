//USEUNIT BD_Action
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFActionable

/**
 * Contains object that encapsulates an element that can be expanded and collapsed
 * @author Jennifer Li
 * @company BDB
 */

var WPFExpander = WPFActionable.extend({
    FrameworkClassName: "WPFExpander", 
    ErrorType: WPFExpanderError,
    AllowedClassNames: ["System.Windows.Controls.Expander"],
    Actions:{
        "expand": new Action({ValidStates: { "Enabled": true, "Visible": true }}),
        "collapse": new Action({ValidStates: { "Enabled": true, "Visible": true }}) 
    },   

    IsExpanded: false,
       
    init: function(options){
        this._super(options);
        
        this.IsExpanded = this.TCObject.IsExpanded;  
    },
    
    expand: function(){
        if (this.IsValidAction(this.Actions.expand)){
            this.TCObject.IsExpanded = true;
            this.IsExpanded = true;
        }     
    },
    
    collapse: function(){
        if (this.IsValidAction(this.Actions.collapse)){
            this.TCObject.IsExpanded = false;
            this.IsExpanded = false;  
        }
    }
})