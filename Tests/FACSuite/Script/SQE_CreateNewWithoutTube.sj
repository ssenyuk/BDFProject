//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script CreateNewWithoutTube is keyword for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains one keyword, CreateNewWithoutTube, which is test in
// the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. Logging should be performed on to 
// the application
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
//USEUNIT CM_pressKey
//USEUNIT FS_ManageExperimentsView   
//USEUNIT FS_ExperimentDataSources

/* @description This function is keyword 'CreateNewWithoutTube'
*/ 
var CreateNewWithoutTube = {
   Description: "Create new without tube",        
   Steps: [
      new StepExecution({
         Description: "create new without tube",
         StepFunction: _CreateNewWithoutTube
      })             
   ]
}; 

/* @ignore
* @description This function will be used to create new experiment without tube.
* @param {event} <e> this parameter is event.
*/ 
function _CreateNewWithoutTube(e){
   this.Status = StepStatus.Failed;
   var mainWindow = Applications.getFacSuiteMainWindow(this); 
   mainWindow.Workspaces.Items.ExperimentNavigateButton.click();
   // mainWindow.Workspaces.select({Text: mainWindow.ExperimentButton});
   mainWindow.findTab(FSManageExperimentsView)
             .addExperiment();  
   var dataSources = mainWindow.findTab(FSExperimentDataSources);
   dataSources.selectTube();    
   Keyboard.del();  
   var deleteTubeDialog = dataSources.getDeleteTubeDialog();
   deleteTubeDialog.clickYes();
   this.Status = StepStatus.Passed; 
}