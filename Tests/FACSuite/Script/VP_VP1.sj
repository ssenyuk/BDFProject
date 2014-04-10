//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT FS_FACSuite
////USEUNIT VP_Case1
////USEUNIT VP_Case2
//USEUNIT VP_TextLoggerHandlers

/**
 * contains usage examples for the Verification object
 * @author Noel Rice
 * @company Falafel Software
 */
 
function test(){

    var appManager = new AppManager({Apps: [
        new App({TestedApp: TestedApps.FACSimulator}),
        new FACSuite() 
    ]});
    appManager.runAll();
    
    appManager
        .Apps
        .FACSuite
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
        })     
    
    var path = appManager
        .Settings.VP
        .Settings.Paths
        .Settings.OutputFolder.Value;
        
    var textLogger = new TextLogger({
        Path: path,
        FileName: "FSS-FAQ-1559.txt"
    });  
    
    Indicator.Hide();   
                
    new VerificationProcedure({
        AppManager: appManager,
        Name: "FSS-FAQ-1559",
        Version: "1.0",
        Date: "01/14/2013",
        AUT: appManager.Apps.FACSuite.Name,
        AUTVersion: "1.1.0.4445",
        Params: {TextLogger: textLogger}, 
        Cases: [case1, case2],
        OnProcedureStarted: procedureStarted,
        OnCaseStarted: caseStarted,
        OnStepStarted: stepStarted,
        OnStepCompleted: stepCompleted,
        OnCaseCompleted: caseCompleted,
        OnProcedureCompleted: procedureCompleted
    }).run(); 
}