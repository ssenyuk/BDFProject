//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script ImportFCS is keyword for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains one keyword, ImportFCS, which is test in
// the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. Logging should be performed 
// on to the application. Experiment's view window should be opened.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-01-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_StepExecution
//USEUNIT BD_SqeKeyword 
//USEUNIT CM_ApplicationHelper
//USEUNIT FS_ExperimentDataSources 
//USEUNIT FS_OpenFileDialog 

/* @description This function is keyword 'ImportFCS'
*/ 
var ImportFCS = {
   Description: "Import FCS",        
   Steps: [
      new StepExecution({
         Description: "import FCS",
         StepFunction: _ImportFCS
      })             
   ]
}; 

/* @ignore
* @description This function will be used for import FCS file(-s).
* @param {event} <e> this parameter is event.
*/ 
function _ImportFCS(e){
   this.Status = StepStatus.Failed;
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   var keywoardParams = this.Parent.KeywordParams;
   var option = keywoardParams.Option;
   var location = keywoardParams.Location;
   var fileName = keywoardParams.FileName;
   if (option === "FileMenu"){
      mainWindow.importViaFileMenu();
   }
   if (option === "ImportFCSButton"){
      var fsExperimentDataSources = mainWindow.findTab(FSExperimentDataSources)
      fsExperimentDataSources.navigateMenu(fsExperimentDataSources.ImportFCSFilesButton); 
   }
   var openDialog = mainWindow.App.waitForWindow({Text: "Select FCS Files to Import"})
                              .cast(FSOpenFileDialog);
   openDialog.openFile(fileName,location);    
   this.Status = StepStatus.Passed; 
}