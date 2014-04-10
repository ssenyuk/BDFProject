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
// 1 02-19-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_StepExecution
//USEUNIT BD_SqeKeyword 
//USEUNIT FS_ExperimentPanelWorksheets  
//USEUNIT CM_ApplicationHelper

/* @description This function is keyword 'CreateGate'
*/ 
var CreateGate = {
   Description: "Create gate",        
   Steps: [
      new StepExecution({
         Description: "create gate",
         StepFunction: _CreateGate
      })             
   ]
}; 
    
/* @ignore
* @description This function will be used to create gate.
* @param {event} <e> this parameter is event.
*/ 
function _CreateGate(e){
   this.Status = StepStatus.Failed;
   var keywoardParams = this.Parent.KeywordParams;
   var gateType = keywoardParams.GateType;
   var txtXParameter = keywoardParams.txtXParameter;
   var txtYParameter = keywoardParams.txtYParameter;
   var approximateArea = keywoardParams.ApproximateArea;
   var mainWindow = Applications.getFacSuiteMainWindow(this);  
   var paneWorksheets = mainWindow.findTab(FSExperimentPanelWorksheets);
   paneWorksheets.selectWorksheets(gateType);
   var plot = paneWorksheets.findPlot({txtXParameter: txtXParameter, txtYParameter: txtYParameter});  
   plot.createGateArea(approximateArea);                                       
   this.Status = StepStatus.Passed; 
}