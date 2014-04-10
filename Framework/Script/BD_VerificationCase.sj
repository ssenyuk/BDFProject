//USEUNIT BD_Event
//USEUNIT BD_Utils
//USEUNIT BD_StepBase

/**
 * Contains object encapsulates a BD verification procedure
 * @author Noel Rice
 * @company Falafel Software
 */
 
var VerificationCase = StepContainerBase.extend({
    FrameworkClassName: "VerificationCase",
    ErrorType: VerificationCaseError,
    CaseNumber: null,
    
    init: function(options){
        this._super(options); 
        this.validateInitOptions(["CaseNumber"]); 
    },

    run: function(){
    
        if (this.Active){
            startTime = new Date(); 
          
            this.setCase(this);
            
            // get a fresh copy of params and publish
            var params = {Case: this}; 
            this.publish("OnStarted", params);
            
            if (this._super){
                this._super(); 
            }
            
            // update params and publish            
            params["ExecutionTime"] = new BDUtils().getElapsedTime(startTime);
            this.publish("OnCompleted", params);
        }
        
        return this;         
    }
}); 