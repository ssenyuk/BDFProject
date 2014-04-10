//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT SQE_LogOutLogIn   

var case1 = 
    new VerificationCase({
        CaseNumber: "1",
        Description: "FSS-FAQ-1559 - After data acquisition, parameter labels shall be preserved in the FCS file.",
        Steps: [
             
            new SqeKeyword(loginKeyword)
                .setKeywordParams({UserName: "Noel", Password: "Falafel"}), 
                
            new StepExecution({
                StepNumber: "1.1",
                Description: "Create a new experiment.",
                StepFunction: function(e){
                    Log.Message(e.Step.StepNumber + "  " + e.Step.Description); 
                    Delay(100);
                   
                    // save a simple value in params for retrieval by following step
                    var _case = e.Step.Parent;
                    var vp = _case.Parent; 
                    vp.Params["MyData"] = "Saved data associated with VP"; 
                    _case.Params["MyData"] = "Saved data associated with case"; 
                    e.Step.Params["MyData"] = "Saved data associated with step"; 
                    
                    e.Step.Status = StepStatus.Passed; 
                },
                Steps: [
                    new StepExecution({
                        StepNumber: "1.1.A",
                        Description: "Create a new experiment substep 1.",
                        StepFunction: function(e){
                            Log.Message(e.Step.StepNumber + "  " + e.Step.Description); 
                            Delay(100);
                            e.Step.Status = StepStatus.Passed;
                        }
                    }) 
                ]                
            }),  
            new StepExecution({
                StepNumber: "1.2",
                Description: "Go to Tube Properties -> Reagents tab and assign CD3 to FITC.",
                StepFunction: function(e){
                    Log.Message(e.Step.StepNumber + "  " + e.Step.Description); 
                    
                    // retrieve variable from previous step
                    var _case = e.Step.Parent;
                    var vp = _case.Parent; 
                    Log.Message(_case.Steps[1].Params.MyData); 
                    
                    Delay(100);
                    e.Step.Status = StepStatus.Failed;  
                } 
            }),
            new StepVerification({
                StepNumber: "1.3",
                Description: "Verify that Plot is displaying CD3 FITC as parameter.",
                StepFunction: function(e){
                    Log.Message(e.Step.StepNumber + "  " + e.Step.Description); 
                    Delay(100);             
                    e.Step.Status = StepStatus.Passed; 
                } 
            }) 
        ]                
    })   
