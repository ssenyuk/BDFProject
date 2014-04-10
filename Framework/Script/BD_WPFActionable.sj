//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_Action

/**
 * Encapsulates an object that validates its own actions. 
 * For example, a WPFButton should click only when the button is enabled and visible.
 * 
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFActionable = WPFElement.extend({
    FrameworkClassName: "WPFActionable",  
    ErrorType: WPFActionableError, 
    Actions: null,
    
    init: function(options){
        this._super(options); 
        
       if (this.validatePropertyAssignments(["Actions"], "init")){
            // verify that each action object inherits from Action
            for(var prop in this.Actions){
                var action = this.Actions[prop]; 
                if (!action instanceof Action){
                    this.error(ErrorMessages.InitInvalidAction); 
                } else {
                    // Each action member should have at least one valid state 
                    if (action.ValidStates == {}){
                        this.error(ErrorMessages.InitInvalidStates); 
                    }
                }
            }
        } 
    },
    
    // verify that the object is in a valid state to perform an action
    IsValidAction: function(action){
        var result = true, isValid = true, stateString = ""; 
        for(var state in action.ValidStates){
            if (this[state] != action.ValidStates[state]){
                result = false;
                value = this[state].toString();  
                
                // '"%s" state "%s" is invalid to perform action "%s"'
                this.error(ErrorMessages.InvalidAction,
                        this.Name, state, value, this._getActionName(action)); 
            };
        }
        return result;             
    }, 
    
    // private methods
        
    _getActionName: function(action){
        for(var prop in this.Actions){
            if (this.Actions[prop] == action){
                return prop; 
            }
        }
        return ""; 
    }
})