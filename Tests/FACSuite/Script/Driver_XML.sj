//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT FS_FACSuite
//USEUNIT BD_XmlDataProvider
//USEUNIT BD_DataDrivenVerificationCase
//USEUNIT VP_TextLoggerHandlers


/**
 * contains usage examples for the Verification object
 * @author Ivan Getsman
 * @company A1QA
 */
function test(){

    var config = new XmlDataProvider({XMLPath: "XML/VP_FS_AP_Acceptance_3_A.xml"});
    config.load();
    var main = config.readMainData();
    var common = config.readCommonParameters();
    var cases = config.readCases();
    
    var appManager = new AppManager({Apps: [
        new App({TestedApp: TestedApps.FACSimulator}),
        new FACSuite() 
    ]});
    appManager.runAll();
    
    appManager
        .Apps
        .FACSuite
        .login({
            UserName: common.login, 
            Password: common.password
        })     
    
    var path = appManager
        .Settings.VP
        .Settings.Paths
        .Settings.OutputFolder.Value;
        
    var textLogger = new TextLogger({
        Path: path,
        FileName: main.name + ".txt"
    });  
    
    Indicator.Hide();
    
    var ddCase = new DataDrivenVerificationCase();
    var listOfCases = ddCase.getDataDrivenCases(cases);   
  
    new VerificationProcedure({
          AppManager: appManager,
          Name: main.name,
          Version: main.version,
          Date: main.date,
          AUT: appManager.Apps.FACSuite.Name,
          AUTVersion: main.AUTVersion,
          Params: {TextLogger: textLogger}, 
          Cases: listOfCases,
          OnProcedureStarted: procedureStarted,
          OnCaseStarted: caseStarted,
          OnStepStarted: stepStarted,
          OnStepCompleted: stepCompleted,
          OnCaseCompleted: caseCompleted,
          OnProcedureCompleted: procedureCompleted
    }).run(); 
    
}