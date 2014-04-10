//USEUNIT BD_Utils
//USEUNIT BD_StepContainerBase
//USEUNIT VP_StepStatus

/**
 * Contains object encapsulates a BD verification procedure step
 * @author Noel Rice
 * @company Falafel Software
 * @modify Galina Makhotkina
 * @company A1QA
 */

var StepBase = StepContainerBase.extend({
    FrameworkClassName: "StepBase",
    ErrorType: StepBaseError,
    StepFunction: null,
    StepNumber: null,
    
            //!! description is required
            //!! stepnumber is required
            //!! StepFunction is required    

    run: function(){
        this.StartTime = new Date(); 
        
        // get a fresh copy of params and publish
        var params = {Step: this};  
        this.publish("OnStarted", params);
        
        // invoke user javascript code
        this.callStepFunction(params);
        
        // update params and publish
        params["ExecutionTime"] = new BDUtils().getElapsedTime(this.StartTime);
        this.publish("OnCompleted", params);

        if (this._super){
            this._super();
        } 
        return this;         
    },
          
    setStepParams: function(options){
        this.StepParams = options; 
        return this; 
    },
    
    setStepNumber: function(stepNumber){
        this.StepNumber = stepNumber;
        return this; 
    }, 
    
    // override in the descendant class to alter or react to 
    // params before or after the function
    callStepFunction: function(params){
        this.StepFunction(params);
        return this; 
    }
}); 