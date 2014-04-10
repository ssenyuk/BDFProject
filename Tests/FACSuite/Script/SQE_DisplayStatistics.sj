//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script EditStatistics is keyword for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains one keyword, DisplayStatistics
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
//===============================================================

//USEUNIT BD_StepExecution
//USEUNIT BD_SqeKeyword 
//USEUNIT FS_ExperimentPanelWorksheets   
//USEUNIT FS_ConfigureRunPointerStatisticsWindow
//USEUNIT CM_ApplicationHelper

/* @description This function is keyword 'Display Statistics'
*/ 
var DisplayStatistics = {
   Description: "Display Statistics",        
   Steps: [
      new StepExecution({
         Description: "display statistics",
         StepFunction: _DisplayStatistics
      })             
   ]
}; 
    
/* @ignore
* @description This function will be used for editing statistics.
* @param {event} <e> this parameter is event.
*/ 
function _DisplayStatistics(e){
   
  var map = {
  "Mean":1,
  "GeoMean":2,
  "SD":3,
  "CV":4,
  "RSD":5,
  "RCV":6,
  "Median":7,
  "Min": 8,
  "Max": 9,
  "Mode":10
}

function getIndexByName(name){
    return map[name];
}
   
   this.Status = StepStatus.Failed;
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   var keywoardParams = this.Parent.KeywordParams;
   var statisticToCheck = keywoardParams.StatisticToCheck;
   var statisticToUncheck = keywoardParams.StatisticToUncheck;
   var tubeNamesPopulations = keywoardParams.TubeNamesPopulations;
   var gridType = keywoardParams.GridType;
   var statisticsDialog = mainWindow.findTab(FSExperimentPanelWorksheets)   
                                     .getStatisticsDialog(gridType);
   var configureRunPointerStatisticsWindow = getConfigureRunPointerStatisticsWindow(this);

   for (i in statisticToCheck){
   indexesToCheck = statisticToCheck[i].split(" ");
   var checkbox = configureRunPointerStatisticsWindow.getCheckbox(indexesToCheck[0], getIndexByName(indexesToCheck[1]));
   checkbox.check();
   }
   
   for (i in statisticToUncheck){
   indexesToUncheck = statisticToUncheck[i].split(" ");
   var checkbox = configureRunPointerStatisticsWindow.getCheckbox(indexesToUncheck[0], getIndexByName(indexesToUncheck[1]));
   checkbox.uncheck();
   }
   configureRunPointerStatisticsWindow.closeConfigureRunPointerStatisticsWindow();
   this.Status = StepStatus.Passed; 
}

function getConfigureRunPointerStatisticsWindow(object){
  var configureRunPointerStatisticsWindow = Applications.getFacSuiteWindow(object)
                                     .waitForWindow({Text: "Configure Run Pointer Statistics"})
                                     .cast(FSConfigureRunPointerStatisticsWindow);
  return configureRunPointerStatisticsWindow;
}   