//USEUNIT BD_StepExecution
//USEUNIT BD_SqeKeyword

var LogOutLogIn = 
    {
        Description: "Login",        
        Steps: [
            new StepExecution({
                Description: "login",
                StepFunction: mylogoutLogin
            })             
        ]
    }; 
    
    
function mylogoutLogin(e){
    var sqeKeyword = e.Step.Parent; 
    var _case = sqeKeyword.Parent; 
    var vp = _case.Parent; 
    var appManager = vp.AppManager; 
    var facSuite = appManager.Apps.FACSuite;

    facSuite.logout(); 
    facSuite.login({
        UserName: sqeKeyword.KeywordParams.UserID, 
        Password: sqeKeyword.KeywordParams.Password
    });
 
    e.Step.Status = StepStatus.Passed; 
}