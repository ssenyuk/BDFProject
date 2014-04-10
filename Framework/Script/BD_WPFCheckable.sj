//USEUNIT BD_Action
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFActionable

/**
 * Contains object that encapsulates an element that can be checked and unchecked
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFCheckable = WPFActionable.extend({
    FrameworkClassName: "WPFCheckable", 
    ErrorType: WPFCheckableError,
    Actions:{
        "check": new Action({ValidStates: { "Enabled": true, "Visible": true }}),
        "uncheck": new Action({ValidStates: { "Enabled": true, "Visible": true }}) 
    },   

    IsChecked: false,
       
    init: function(options){
        this._super(options);
        
        this.IsChecked = this.TCObject.IsChecked.OleValue;  
    },
    
    check: function(){
        if (this.IsValidAction(this.Actions.check)){
            this.TCObject.IsChecked = true;
            this.IsChecked = true;
        }     
    },
    
    uncheck: function(){
        if (this.IsValidAction(this.Actions.uncheck)){
            this.TCObject.IsChecked = false;
            this.IsChecked = false;  
        }
    }
})