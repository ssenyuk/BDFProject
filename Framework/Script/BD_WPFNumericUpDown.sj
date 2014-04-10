//USEUNIT BD_WPFActionable
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Action

/**
 * Contains object that encapsulates an updown control
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFNumericUpDown = WPFActionable.extend({
    FrameworkClassName: "WPFNumericUpDown",
    ErrorType: WPFNumericUpDownError, 
    AllowedClassNames: ["BD.FACSuite.CustomControls.NumericUpDown"],
    Actions:{
        "increment": new Action({ValidStates: { "Enabled": true, "Visible": true }}),
        "decrement": new Action({ValidStates: { "Enabled": true, "Visible": true }}) 
    },    
    Value: 0,
    MinValue: 0,
    MaxValue: 0,
    LargeChange: 0,
    DecimalPlaces: 0,
    
    init: function(options){
        this._super(options);
        
        this.Value = this.TCObject.Value; 
        this.MinValue = this.TCObject.MinValue; 
        this.MaxValue = this.TCObject.MaxValue;
        this.LargeChange = this.TCObject.LargeChange;
        this.DecimalPlaces = this.TCObject.DecimalPlaces;  
    },
    
    increment: function(){
        if (this.IsValidAction(this.Actions.increment)){
            this.TCObject.IncrementValue(false);
            this.Value = this.TCObject.Value;
        }
    },
    
    decrement: function(){
        if (this.IsValidAction(this.Actions.decrement)){
            this.TCObject.DecrementValue(false);
            this.Value = this.TCObject.Value;
        }
    }
})