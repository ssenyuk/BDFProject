//USEUNIT BD_Event
//USEUNIT BD_Utils
//USEUNIT VP_StepStatus

/**
 * Contains object encapsulates a collection of steps
 * @author Noel Rice
 * @company Falafel Software
 */
 
var StepContainerBase = Event.extend({
    FrameworkClassName: "StepContainerBase",
    ErrorType: StepContainerBaseError,
    Description: null,
    Parent: null,
    Active: true,
    Params: {},
    Status: StepStatus.None,
    Steps: [],
    Case : null,
    
    run: function(){
        if (this.Active){
            // run child steps
            for(var index in this.Steps){ 
                var step = this.getStep(this.Steps, index)();
                step.Params = {};
                step.Parent = this;
                step.Case = this.Case;
                step.run(); 
            }
            
            // interpret statuses
            if (this.Status === StepStatus.None){
                this.Status = StepStatus.Passed; 
            // propagate failed status upwards            
            } else if (this.Status === StepStatus.Failed){           
                this.Parent.Status = StepStatus.Failed; 
            }                 
        }
        return this;         
    },
    
    // returns a function that isolates the index
    getStep: function(steps, index){
        return function(){
            return steps[index];
        }    
    },

    setCase: function(myCase){ 
        this.Case = myCase;
    },

    _getTopmostParent: function(startingParent){
        var parent = startingParent; 
        while (parent.Parent){
            parent = parent.Parent; 
        }
        return parent; 
    }
}); 