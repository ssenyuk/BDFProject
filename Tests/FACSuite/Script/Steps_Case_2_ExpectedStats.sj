//USEUNIT FS_ManageExperimentsView   
//USEUNIT FS_ExperimentDataSources
//USEUNIT FS_TubePropertiesWindow
//USEUNIT FS_TubeProperties_Compensation
//USEUNIT FS_WorklistsWorkspace
//USEUNIT FS_ExperimentView
//USEUNIT FS_ExperimentPanelWorksheets
//USEUNIT CM_ApplicationHelper
//USEUNIT FS_ConfigureRunPointerStatisticsWindow
//USEUNIT FS_ConfigureRunPointerStatisticsDecimalPlaces

/* @description This function is 'DeselectEnabledCompensation' use for step 2.3
*/ 
var DeselectEnabledCompensation = {
   Description: "Select tube, open Properties, open Compensation tab, deselect Enable Compensation",
   StepFunction: deselectEnabledCompensation
};

/* @description This function is 'CloseTubePropertiesWindow' use for step 2.4
*/ 
var CloseTubePropertiesWindow = {
   Description: "Close Tube Properties Window",
   StepFunction: closeTubePropertiesWindow
};

/* @description This function is 'CreateStatisticTable' use for step 2.5
*/ 
var CreateStatisticTable = {
   Description: "Create statistic table",
   StepFunction: createStatisticTable
};

/* @description This function is 'SetDecimalValues' use for step 2.6
*/ 
var SetDecimalValues = {
   Description: "Set decimal values",
   StepFunction: setDecimalValues
};

/* @description This function is 'VerifyPopulationInTheGrid'  use for steps 2.8 - 2.14 
*/     
var VerifyPopulationInTheGrid = {
    Description: "Verify the values as mentioned in the table",
    StepFunction: _verifyPopulationInTheGrid
};     


/* @description This function is 'CloseExperiment'  use for step 2.15
*/     
var CloseExperiment = {
   Description: "Close experiment",
   StepFunction: closeExperiment
};  

/* @description This function will be used for deselect Enabled Compensation in Tube Properties menu
* @param {event} <e> this parameter is event.
*/ 
function deselectEnabledCompensation(e){
   this.Status = StepStatus.Failed;
   var mainWindow = Applications.getFacSuiteMainWindow(this); 
   var dataSources = mainWindow.findTab(FSExperimentDataSources);
   dataSources.openTubeProperties();
   var tubePropertiesWindow = getTubePropertiesWindow(this);
   tubePropertiesWindow.selectCompensationTab();
   var tubePropertiesCompensationWindow = getTubePropertiesCompensationWindow(this);
   tubePropertiesCompensationWindow.uncheckEnableCompensation();
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used to close Tube Properties munu
* @param {event} <e> this parameter is event.
*/ 
function closeTubePropertiesWindow(e){
   this.Status = StepStatus.Failed;
   var tubePropertiesCompensationWindow = getTubePropertiesCompensationWindow(this);
   tubePropertiesCompensationWindow.closeTubePropertiesWindow();
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for create statistic table
* @param {event} <e> this parameter is event.
*/ 
function createStatisticTable(e){
   this.Status = StepStatus.Failed; 
   var pathParameters = this.StepParams.Path;
   var experimentPanelWorksheets = getExperimentPanelWorksheets(this);   
   experimentPanelWorksheets.createStatisticsTable(pathParameters);                      
   this.Status = StepStatus.Passed; 
}       

/* @description This function will be used for setting decimal values in in Configure Run Pointer Statistics menu
* @param {event} <e> this parameter is event.
*/ 
function setDecimalValues(e){
   this.Status = StepStatus.Failed;
   var stepParams = this.StepParams;
   var tubeNamesPopulations = stepParams.TubeNamesPopulations;
   var gridType = stepParams.GridType;
   var statName = stepParams.StatisticName;
   var statValue = stepParams.Value;
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   var statisticsDialog = mainWindow.findTab(FSExperimentPanelWorksheets)   
                                     .getStatisticsDialog(gridType);
   var configureRunPointerStatisticsWindow = getConfigureRunPointerStatisticsWindow(this);
   configureRunPointerStatisticsWindow.selectDecimalPlacesTab();
   var decimalPlacesWindow = getDecimalPlacesWindow(this);
   for(i=0; i<statName.length; i++) 
      {decimalPlacesWindow.setNumericValue(statName[i], statValue)};
   decimalPlacesWindow.closeConfigureRunPointerStatisticsWindow();
   this.Status = StepStatus.Passed; 
}

function selectPopulation(e){
   var plotEditor = getPlotEditor(this);
   var plotEditorGeneral = getPlotEditorGeneral(this);
   plotEditorGeneral.selectPopulation(namePopulation);                                      
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for verify Population Statistics Is The Same As Noted
* @param {event} <e> this parameter is event.
*/ 

function _verifyPopulationInTheGrid(e){
   this.Status = StepStatus.Failed;
   var stepParams = this.StepParams;
   var experimentView = getExperimentView(this);
   var nameGate = stepParams.Gate;
   var gridType = stepParams.GridType;
   var grid = experimentView.getStatisticsGridByName(gridType);
   var fields = stepParams.Fields;
   
   for (i in fields){
       
   var parameter = fields[i].Parameter;
   var result = fields[i].Result; 
   var text = grid.getCellTextByName(parameter,nameGate); 
   var textNumber = text.replace(/[^0-9\,-]+/g, '');
   textNumber = textNumber.replace(",", ".");
   var status  = (textNumber == result);              
   if (status) {
      this.logMessage(parameter + " has " + result + " value");
        }
   else {
      this.logMessage(parameter + " doesn't have " + result + " value");
        }
   }
   this.Status = StepStatus.Passed;
} 

/* @description This function will be used to close experiment
* @param {event} <e> this parameter is event.
*/ 
function closeExperiment(e){
   this.Status = StepStatus.Failed;
   var mainWindow = Applications.getFacSuiteMainWindow(this);      
   var worklistsWorkspace =  mainWindow.findTab(FSWorklistsWorkspace); 
   worklistsWorkspace.closeCurrentTab();
   this.Status = StepStatus.Passed; 
} 

function getExperimentView(object){
   var mainWindow = Applications.getFacSuiteMainWindow(object);
   var experimentView =  mainWindow.findTab(FSExperimentView);
   return experimentView;
}   

function getExperimentPanelWorksheets(object){
   var mainWindow = Applications.getFacSuiteMainWindow(object);
   var experimentPanelWorksheets =  mainWindow.findTab(FSExperimentPanelWorksheets);
   return experimentPanelWorksheets;
}  

function getTubePropertiesWindow(object){
   var tubePropertiesWindow = Applications.getFacSuiteWindow(object)
                                    .waitForWindow({Text: "Tube Properties"})
                                    .cast(FSTubePropertiesWindow);
   return tubePropertiesWindow;
}   

function getTubePropertiesCompensationWindow(object){
   var tubePropertiesCompensationWindow = Applications.getFacSuiteWindow(object)
                                    .waitForWindow({Text: "Tube Properties"})
                                    .cast(FSTubePropertiesCompensation);
   return tubePropertiesCompensationWindow;
}   

function getConfigureRunPointerStatisticsWindow(object){
  var configureRunPointerStatisticsWindow = Applications.getFacSuiteWindow(object)
                                     .waitForWindow({Text: "Configure Run Pointer Statistics"})
                                     .cast(FSConfigureRunPointerStatisticsWindow);
  return configureRunPointerStatisticsWindow;
}   

function getDecimalPlacesWindow(object){
  var decimalPlacesWindow = Applications.getFacSuiteWindow(object)
                                    .waitForWindow({Text: "Configure Run Pointer Statistics"})
                                    .cast(FSConfigureRunPointerStatisticsDecimalPlaces);
  return decimalPlacesWindow;
}   

   