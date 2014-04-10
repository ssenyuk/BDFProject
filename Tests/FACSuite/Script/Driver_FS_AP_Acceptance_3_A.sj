//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script Driver_FS_AP_Acceptance_3_A is test for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite, FACSimulator
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. FACSuite and FACSimulator must be 
// installed.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-01-2014 Galina Makhotkina A1QA Created
// 2 02-17-2014 Dmitry Lemeshko A1QA Added Case_2_ExpectedStats
//===============================================================

//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT FS_FACSuite
//USEUNIT Case_1_MultiColorGating
//USEUNIT Case_2_ExpectedStats
//USEUNIT Case_3
//USEUNIT VP_TextLoggerHandlers

function Driver_FS_AP_Acceptance_3_A(){
   var appManager = new AppManager({
      Apps: [
         new App({TestedApp: TestedApps.FACSimulator}),
         new FACSuite() 
      ]
   });
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
      Version: "1.1",
      Date: "02/01/2014",
      AUT: appManager.Apps.FACSuite.Name,
      AUTVersion: "1.1.0.4445",
      Params: {TextLogger: textLogger}, 
      //Cases: [case_1_MultiColorGating],
      //Cases: [case_1_MultiColorGating, case_2_ExpectedStats],
      //Cases: [case_2_ExpectedStats],
      Cases: [case_3],
      OnProcedureStarted: procedureStarted,
      OnCaseStarted: caseStarted,
      OnStepStarted: stepStarted,
      OnStepCompleted: stepCompleted,
      OnCaseCompleted: caseCompleted,
      OnProcedureCompleted: procedureCompleted
   }).run(); 
}