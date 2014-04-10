//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_TestCompleteBase

/**
 * Defines a state and it's value
 * @author Noel Rice
 * @company Falafel Software
 */
 
var State = TestCompleteBase.extend({
    Name: "",
    Value: "",
    ErrorType: StateError,
    init: function(options){
        this._super(options); 
        this.validateInitOptions(["Name", "Value"]); 
    }
}); 