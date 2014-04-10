//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script AddPopulation is keyword for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains one keyword, AddPopulation, which is test in
// the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. Logging should be performed 
// on to the application. Experiment's view window should be opened.
// On the canvas must have at least one statistical table.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-01-2014 Galina Makhotkina A1QA Created
// 2 02-17-2014 Ivan Getsman A1QA Added ability to work with RunPointerStatistics table
//===============================================================

//USEUNIT BD_StepExecution
//USEUNIT BD_SqeKeyword 
//USEUNIT FS_ExperimentPanelWorksheets   
//USEUNIT CM_ApplicationHelper

/* @description This function is keyword 'AddPopulation'
*/ 
var AddPopulation = {
   Description: "Add population",        
   Steps: [
      new StepExecution({
         Description: "add population",
         StepFunction: _AddPopulation
      })             
   ]
}; 
    
/* @ignore
* @description This function will be used for add population.
* @param {event} <e> this parameter is event.
*/ 
function _AddPopulation(e){
   this.Status = StepStatus.Failed;
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   var keywoardParams = this.Parent.KeywordParams;
   var tubeNamesPopulations = keywoardParams.TubeNamesPopulations;
   var gridType = keywoardParams.GridType;
   var populationsDialog = mainWindow.findTab(FSExperimentPanelWorksheets)   
                                     .getPopulationsDialog(gridType);
   // there are two different windows can be opened
   if (gridType){
      populationsDialog.addPopulationWithoutTree(tubeNamesPopulations);    
   } 
   else {
      populationsDialog.addPopulation(tubeNamesPopulations); 
      populationsDialog.close(); 
   }                                            
   this.Status = StepStatus.Passed; 
}