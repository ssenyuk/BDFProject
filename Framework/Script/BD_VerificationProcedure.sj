//USEUNIT BD_Event
//USEUNIT BD_Utils
//USEUNIT BD_StepBase
//USEUNIT BD_VerificationCase

/**
 * Contains object encapsulates a BD verification procedure
 * @author Noel Rice
 * @company Falafel Software
 */
 
// !! VP header passed in
// !! VP header parts may need to be populated on the fly, 
// dynamic info may change. 
 
var VerificationProcedure = Event.extend({
    FrameworkClassName: "VerificationProcedure",
    ErrorType: VerificationProcedureError,
    Name: null,
    Version: null,
    Date: null,  
    AUT: null,
    AUTVersion: null,
    Description: null,
    Cases: [],
    AppManager: null,
    Params: {},
    Status: StepStatus.None,
    
    init: function(options){       
    
        this._super(options);
        
        if (this.validateInitOptions(["Name", "Version", "Date", "AUT", "AUTVersion"])){
        
            if (options.OnProcedureStarted){
                this.subscribe("OnProcedureStarted", options.OnProcedureStarted);
            }
        
            if (options.OnProcedureCompleted){
                this.subscribe("OnProcedureCompleted", options.OnProcedureCompleted);
            }
    
            if (options.Cases){
                for(var index in options.Cases){
                    var _case = this._getCase(options.Cases, index)(); 
                    if (_case instanceof VerificationCase){
                
                        _case.Parent = this;
                        // initial set of params from top-level vp object
                        _case.Params = new BDUtils().cloneProperties(this.Params);
                     
                        if (options.OnCaseStarted){
                            _case.subscribe("OnStarted", options.OnCaseStarted);
                        }
            
                        if (options.OnCaseCompleted){
                            _case.subscribe("OnCompleted", options.OnCaseCompleted);
                        }
                        
                        this.assignSteps(_case, this)();  
             
                    } else {
                        this.error(ErrorMessages.IncorrectType, "_case", "VerificationCase");
                        return;  
                    }
                }
            }     
                
            this.Params["Settings"] = this.AppManager.Settings;    
        }             
    },
    
    _getCase: function(cases, index){
        return function(){
           return cases[index];
        }
    },
        
    run: function(){
        var startTime = new Date();
        
        // get a fresh copy of params and publish
        var params = {VerificationProcedure: this};
        this.publish("OnProcedureStarted", params);
        
        // run cases
        for(var index in this.Cases){
            var _case = this._getCase(this.Cases, index)(); 
            _case.run(); 
        }
        
        // interpret status
        if (this.Status === StepStatus.None){
            this.Status = StepStatus.Passed; 
        }        
        
        // update params and publish
        params["ExecutionTime"] = new BDUtils().getElapsedTime(startTime);
        this.publish("OnProcedureCompleted", params);
        
        return this;         
    },
                              
    assignSteps: function(stepContainer, verificationProcedure){
        return function(){
            for(var index in stepContainer.Steps){
                var step = stepContainer.getStep(stepContainer.Steps, index)(); 
                step.subscribe("OnStarted", verificationProcedure.OnStepStarted);
                step.subscribe("OnCompleted", verificationProcedure.OnStepCompleted);
                if (step.Steps){
                    verificationProcedure.assignSteps(step, verificationProcedure)();     
                }
            } 
        }            
    }                                     
           
}); 