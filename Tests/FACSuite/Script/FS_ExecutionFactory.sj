//USEUNIT FS_ImportAll

/**
 * Contains  class for Getting Case Object from content
 * @author Ivan Getsman
 * @company A1QA
 */
var ExecutionFactory = Base.extend({
    FrameworkClassName: "ExecutionFactory",
    ErrorType: ConfigurationError,
    XMLPath: null,
    Settings: {},
    Name: "ExecutionFactory",
    IsValid: true,
    
    /* 
    Get step object from content
    */
    createSteps: function(plainSteps){
        steps = [];
        for (i=0;i<plainSteps.length;i++){
            var func = plainSteps[i]['class'];
            var stepNumber = plainSteps[i].number;
            var stepParam = plainSteps[i].parameters;
            switch(plainSteps[i].type) {
                case 'keyword':
			              step = new SqeKeyword(eval(func))
                        .setStepNumber(stepNumber);
                        if (!this.isEmpty(stepParam)) {
                          step.setKeywordParams(stepParam)
                        }
                    break;
                case 'execution':
                    step = new StepExecution(eval(func))
                        .setStepNumber(stepNumber);
                        if (!this.isEmpty(stepParam)) {
                          step.setStepParams(stepParam);
                        }
                    break;
                case 'verification':
                    step = new StepVerification(eval(func))
                        .setStepNumber(stepNumber);
                        if (!this.isEmpty(stepParam)) {
                          step.setStepParams(stepParam);
                        }
                    break;
                default:
                    Log.Message("Incorrect step type")        
            }
            // add step to array
            steps.push(step);
       }
       return steps;
    },

    /* 
      Get VP object from content
    */
    createVerificationCase: function(casesObject){
       var dataDrivenCase = new VerificationCase({
          CaseNumber: casesObject.number,
          Description: casesObject.name,
          Steps: this.createSteps(casesObject.steps)
        });
        return dataDrivenCase;                             
    },

    /*
      Check if the map is empty
    */
    isEmpty : function(map) {
       for(var key in map) {
          if (map.hasOwnProperty(key)) {
             return false;
          }
       }
       return true;
    },
    
    /*
      Constructor
    */
    init: function (options) {
      this._super(options); 
    }


      
});