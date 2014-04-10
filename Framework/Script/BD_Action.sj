//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Base

/**
 * Contains an action and associated states the action may be in.
 * @author Noel Rice
 * @company Falafel Software
 */
 
var Action = Base.extend({
    FrameworkClassName: "Action",
    ValidStates: {}
    // TODO -cFramework -oNoel : provide a ValidState object to act as a model for building states.
    // TODO -cFramework -oNoel : provide provide type checking to verify that ValidState objects are passed in.
}); 