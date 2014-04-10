//USEUNIT BD_Event
//USEUNIT BD_Utils
//USEUNIT BD_StepBase
//USEUNIT VP_StepStatus

/**
 * Contains object encapsulates a BD verification procedure
 * @author Noel Rice
 * @company Falafel Software
 */
 
var SqeKeyword = StepContainerBase.extend({
    FrameworkClassName: "SqeKeyword",
    ErrorType: SqeKeywordError,
    Status: StepStatus.None,
    KeywordParams: {},
    StepNumber: null, 
    
    init: function(options){
        this._super(options); 
        

    },
    
    run: function(){
        if (this.validatePropertyAssignments(["StepNumber"], "init")){
            if (this.Active){
                startTime = new Date(); 

                // get a fresh copy of params and publish
                var params = new BDUtils().cloneProperties(this.Params);
                params["SqeKeyword"] = this;  
                this.publish("OnStarted", params);
            
                // run child steps
                if (this._super){
                    this._super(); 
                }
            
                // get a fresh copy of params and publish
                params = new BDUtils().cloneProperties(this.Params);
                params["ExecutionTime"] = new BDUtils().getElapsedTime(startTime);
                params["SqeKeyword"] = this;  
                this.publish("OnCompleted", params);        
            }
        }
        return this;         
    },
    
    setKeywordParams: function(options){
        this.KeywordParams = options; 
        return this; 
    },
    
    setStepNumber: function(stepNumber){
        this.StepNumber = stepNumber;
        return this; 
    }  
}); 