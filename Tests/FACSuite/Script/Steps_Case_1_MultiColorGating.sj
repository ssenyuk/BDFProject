//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script Steps_Case_1_MultiColorGating is test for smoke testing 
// (Application Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. Logging should be performed 
// on to the application.
//
// External Files Required for the Script:
// Lymphocytes_3,2f,16+56,2f,45,2f,4,2f,19,2f,8.fcs
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-13-2014 Galina Makhotkina A1QA Created
// 2 02-20-2014 Ivan Getsman A1QA Added Steps 1.62 - 1.79
// 3 02-24-2014 Galina Makhotkina A1QA Added Steps 1.80 - 1.85
//===============================================================

//USEUNIT FS_ExperimentView
//USEUNIT CM_ApplicationHelper
//USEUNIT FS_PlotEditorGeneral
//USEUNIT FS_PlotEditorParameters
//USEUNIT FS_GatePropertiesQuadWindow
//USEUNIT FS_SaveExperimentDialog
//USEUNIT FS_ManageExperimentsView
//USEUNIT FS_WorklistsWorkspace
//USEUNIT FS_ExperimentPanelWorksheets

/* @description This function is 'EnterNameF4' use for step 1.6, 1.19
*/ 
var EnterName = {
   Description: "Select gate, open properties, enter name",
   StepFunction: enterName
};  

/* @description This function is 'SelectDisplayHierarchy' use for step 1.7, 1.20
*/ 
var CloseGatePropertiesAndSelectDisplayHierarchy = {
   Description: "Close properties window and select display hierarchy",
   StepFunction: closeGatePropertiesAndSelectDisplayHierarchy
};
   
/* @description This function is 'SelectOptionNotPopulation' use for step 1.8
*/ 
var SelectOptionNotPopulation = {
   Description: "Select option 'NOT' population",
   StepFunction: selectOptionNotPopulation
};
    
/* @description This function is 'CreateStatisticTable' use for step 1.9
*/ 
var CreateStatisticTable = {
   Description: "Create statistic table",
   StepFunction: createStatisticTable
};
       
/* @description This function is 'GoToPlotProperties' use for step 1.11
*/ 
var GoToPlotProperties = {
   Description: "Go to Plot Properties.",
   StepFunction: goToPlotProperties
}; 

/* @description This function is 'VerifyPopulation' step 1.12
*/ 
var VerifyPopulationAndClose = {
   Description: "Verify is displayed in Primary Data Source.",
   StepFunction: verifyPopulationAndClose
};

/* @description This function is 'NoteValuesPopulations' use for step 1.13
*/ 
var NoteValuesPopulations = {
   Description: "Note the values of the populations.",
   StepFunction: noteValuesPopulations
};
 
/* @description This function is 'NoteSumEventsPopulations' use for step 1.14
*/ 
var NoteSumEventsPopulations = {
   Description: "Note the sum of the events populations.",
   StepFunction: noteSumEventsPopulations
};   
        
/* @description This function is 'VerifySumEventsPopulation' step 1.15
*/ 
var VerifySumEventsPopulation = {
   Description: "Verify that sum of the following number of events is equal to # of All Events.",
   StepFunction: verifySumEventsPopulation
};

/* @description This function is 'SelectPopulation' use for step 1.16
*/ 
var SelectPopulation = {
   Description: "Go to Plot Properties. Select population.",
   StepFunction: selectPopulation
};

/* @description This function is 'ClosePlotProperties' use for steps 1.17, 1.25
*/ 
var ClosePlotProperties = {
   Description: "Close plot properties",
   StepFunction: closePlotProperties
};
   
/* @description This function is 'VerifySubPopulation' step 1.21
*/ 
var VerifySubPopulation = {
   Description: "Verify that sub population is displayed as the child of the population",
   StepFunction: verifySubPopulation
}; 
     
/* @description This function is 'ChangePropertiesXParameters' use for step 1.22
*/ 
var ChangePropertiesXParameters = {
   Description: "Go to plot properties. X-parameter change.",
   StepFunction: changePropertiesXParameters
};  

/* @description This function is 'SelectGeneralTab' use for step 1.23
*/ 
var SelectGeneralTab = {
   Description: "Select General tab",
   StepFunction: selectGeneralTab
};  
 
 /* @description This function is 'VerifyPopulations' step 1.24
*/ 
var VerifyPopulations = {
   Description: "Verify is displayed in Primary Data Source.",
   StepFunction: verifyPopulations
};
        
/* @description This function is 'CloseGatePropertiesWindow'  use for step 1.28
*/ 
var CloseGatePropertiesWindow = {
   Description: "Close gate properties window",
   StepFunction: closeGatePropertiesWindow
}; 
 
/* @description This function is 'SelectPopulationAndCloseProperties'  use for step 1.30
*/ 
var SelectPopulationAndCloseProperties = {
   Description: "Select population in General tab in Plot Editor and close it",
   StepFunction: selectPopulationAndCloseProperties
}; 
    
/* @description This function is 'ChangePropertiesYParameters' use for step 1.34
*/ 
var ChangePropertiesYParameters = {
   Description: "Go to plot properties. Y-parameter change.",
   StepFunction: changePropertiesYParameters
};      

/* @description This function is 'OpenPlotPropertiesAndVerifyAxis' step 1.36
*/ 
var OpenPlotPropertiesAndVerifyAxis = {
   Description: "Open plot properties and verify axis on parameters tab",
   StepFunction: openPlotPropertiesAndVerifyAxis
}; 

/* @description This function is 'SelectParametersTabAndMakeBiExponential' step 1.37
*/ 
var SelectParametersTabAndMakeBiExponential = {
   Description: "Select Parameters tab. Make plot to be Bi-exponential",
   StepFunction: selectParametersTabAndMakeBiExponential
};   

/* @description This function is 'CloseHierarchyWindow'
*/ 
var CloseHierarchyWindow = {
   Description: "Close Hierarchy Window",
   StepFunction: closeHierarchyWindow
}; 

/* @description This function is 'OpenDisplayHierarchy'
*/ 
var OpenDisplayHierarchy = {
   Description: "Open Hierarchy Window",
   StepFunction: openDisplayHierarchy
}; 

/* @description This function is 'ChangeXLabelInPlot' use for step 1.62
*/ 
var ChangeXLabelInPlot = {
   Description: "Change X Label In Plot",
   StepFunction: changeXLabelInPlot
};     
    
/* @description This function is 'ChangeYLabelInPlot' use for step 1.63
*/ 
var ChangeYLabelInPlot = {
   Description: "Change Y Label In Plot",
   StepFunction: changeYLabelInPlot
};
    
/* @description This function is 'NavigatePlotPropertiesAndParametersTab' use for step 1.64
*/ 
var NavigatePlotPropertiesAndParametersTab = {
   Description: "Go to Plot Properties and Select Parameters Tab",
   StepFunction: navigatePlotPropertiesAndParametersTab
};     
    
/* @description This function is 'Verify Axis On Parameters Tab On Property Window' use for step 1.65
*/ 
var VerifyAxisOnParametersTabOnPropertyWindow = {
   Description: "Verify Axis On Parameters Tab On Property Window",
   StepFunction: verifyAxisOnParametersTabOnPropertyWindow
};

/* @description This function is 'Open General Tab And Update Population' use for step 1.66
*/   
var OpenGeneralTabAndUpdatePopulation = {
   Description: "Open General Tab And Update Population",
   StepFunction: openGeneralTabAndUpdatePopulation
};

 /* @description This function is 'SelectOptionOrPopulations' use for step 1.43
*/ 
var SelectOptionOrPopulations = {
   Description: "Select option 'Or' populations",
   StepFunction: selectOptionOrPopulations
};
 
/* @description This function is 'VerifyPopulationsHierarchyAndPlotProperties' use for step 1.44
*/ 
var VerifyPopulationsHierarchyAndPlotProperties = {
   Description: "Verify that new logical gate appears in the elements",
   StepFunction: verifyPopulationsHierarchyAndPlotProperties
}; 
    
/* @description This function is 'NavigatePlotPropertiesAndGeneralTab' use for step 1.45
*/ 
var NavigatePlotPropertiesAndGeneralTab = {
   Description: "Navigate plot properties and general tab",
   StepFunction: navigatePlotPropertiesAndGeneralTab
}; 

/* @description This function is 'NavigatePlotPropertiesAndGeneralTab' use for step 1.47
*/ 
var SelectOptionAndPopulations = {
   Description: "Select populations, using gate context menu select option AND",
   StepFunction: selectOptionAndPopulations
};  

/* @description This function is 'VerifyPopulationsHierarchy' use for step 1.48
*/ 
var VerifyPopulationsHierarchy = {
   Description: "In gate hierarchy Verify that populations gate is displayed",
   StepFunction: verifyPopulationsHierarchy
};

/* @description This function is 'SelectUndo' use for step 1.49
*/ 
var SelectUndo = {
   Description: "Click on UNdo icon from the worksheet toolbar",
   StepFunction: selectUndo
};
    
/* @description This function is 'VerifyPopulationsHierarchyDoNotDisplayed' use for step 1.50
*/ 
var VerifyPopulationsHierarchyDoNotDisplayed = {
   Description: "In gate hierarchy Verify that populations gate isn't displayed",
   StepFunction: verifyPopulationsInHierarchyDoNotDisplayed
};  

/* @description This function is 'RedoViaFileMenu' use for step 1.51
*/ 
var RedoViaFileMenu = {
   Description: "Navigate to edit menu. Select option Redo",
   StepFunction: redoViaFileMenu
};  

/* @description This function is 'SelectOptionDeletePopulations'  use for step 1.55
*/     
var SelectOptionDeletePopulations = {
   Description: "From gate hierarchy select gate population and using gate contextual menu select option Delete",
   StepFunction: selectOptionDeletePopulations
};   
    
/* @description This function is 'VerifyPopulationInTheGrid'  use for step 1.55
*/     
var VerifyPopulationInTheGrid = {
    Description: "Verify the events as mentioned in the table",
    StepFunction: _verifyPopulationInTheGrid
};     
  
/* @description This function is 'SelectOptionDeletePopulations'  use for step 1.76
*/     
var SelectOptionDeletePopulationsAndConfirm = {
   Description: "From gate hierarchy select gate population and using gate contextual menu select option Delete And Confirm",
   StepFunction: selectOptionDeletePopulationsAndConfirm
}; 

/* @description This function is 'SelectOptionDeletePopulations'  use for step 1.56
*/     
var SelectOptionRestOfPopulations = {
   Description: "From gate hierarchy select gate population and using gate contextual menu select option Rest of",
   StepFunction: selectOptionRestOfPopulations
}; 

/* @description This function is 'CreateQuadGate'  use for step 1.68
*/ 
var CreateQuadGate = {
   Description: "Create quad gate",
   StepFunction: createQuadGate
};      

/* @description This function is 'SelectQuadGate'  use for step 1.69
*/     
var SelectQuadGate = {
   Description: "Select Quad Gate",
   StepFunction: selectQuadGate
};     

/* @description This function is 'CloseGatePropertiesWindowAndOpenPlotProperties'  use for step 1.70
*/     
var CloseGatePropertiesWindowAndOpenPlotProperties = {
   Description: "Close Gate Properties Window And Open Plot Properties",
   StepFunction: closeGatePropertiesWindowAndOpenPlotProperties
};   

/* @description This function is 'NoteRunPointerStatisticsValuesPopulations' use for step 1.74
*/ 
var NoteRunPointerStatisticsValuesPopulations = {
   Description: "Note RunPointerStatistics Values Populations",
   StepFunction: noteRunPointerStatisticsValuesPopulations
};

/* @description This function is 'VerifyStateViewIsTheSameasNoted' use for step 1.78
*/ 
var VerifyStateViewIsTheSameasNoted = {
   Description: "Verify State View Is The Same as Noted",
   StepFunction: verifyStateViewIsTheSameasNoted
};
    
/* @description This function is 'CheckShowPopulationStatistics' use for step 1.79
*/ 
var CheckShowPopulationStatistics = {
   Description: "Check Show Population Statistics",
   StepFunction: checkShowPopulationStatistics
};    

/* @description This function is 'Verify Population Statistics Is The Same As Noted' use for step 1.80
*/ 
var VerifyPopulationStatisticsIsTheSameAsNoted = {
   Description: "Verify Population Statistics Is The Same As Noted",
   StepFunction: verifyPopulationStatisticsIsTheSameAsNoted
};
 
/* @description This function is 'SaveAs'  use for step 1.81
*/     
var SaveAs = {
   Description: "Save experiment and exit from application",
   StepFunction: saveAs
};

/* @description This function is 'OpenExperimentViaFileMenu'  use for step 1.83
*/     
var OpenExperimentViaFileMenu = {
   Description: "Open experiment",
   StepFunction: openExperimentViaFileMenu
};

/* @description This function is 'CloseExperiment'  use for step 1.85
*/     
var CloseExperiment = {
   Description: "Close experiment",
   StepFunction: closeExperiment
};  
    
/* @description This function will be used for enter name
* @param {event} <e> this parameter is event.
*/ 
function enterName(e){
   this.Status = StepStatus.Failed;   
   var stepParams = this.StepParams;
   var txtXParameter = stepParams.txtXParameter;
   var txtYParameter = stepParams.txtYParameter; 
   var option = stepParams.Option;
   var namePopulation = stepParams.namePopulation;
   var options = {txtXParameter: txtXParameter, txtYParameter: txtYParameter, option: option, NamePopulation: namePopulation, txtName: stepParams.nameGate};
   var propertiesGateWindow = getExperimentPanelWorksheets(this).getPropertiesGateWindow(options);
   propertiesGateWindow.setGateName(options);         
   this.Status = StepStatus.Passed; 
}
      
/* @description This function will be used for close gate properties window and select display hierarhy
* @param {event} <e> this parameter is event.
*/ 
function closeGatePropertiesAndSelectDisplayHierarchy(e){
   this.Status = StepStatus.Failed;  
   closeGateProperties(this);
   openHierarchyWindow(this);         
   this.Status = StepStatus.Passed; 
}
         
/* @description This function will be used for select option 'NOT' population
* @param {event} <e> this parameter is event.
*/ 
function selectOptionNotPopulation(e){
   this.Status = StepStatus.Failed; 
   var stepParams = this.StepParams; 
   var namePopulation = this.StepParams.NamePopulation;    
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow();   
   hierarchyWindow.selectOptionNot(namePopulation);
   hierarchyWindow.close();                        
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
    
/* @description This function will be used for go to plot properties.
* @param {event} <e> this parameter is event.
*/  
function goToPlotProperties(e){
   this.Status = StepStatus.Failed;
   getPlotEditor(this);
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for verify that object is displayed in 'Primary Data Source'.
* @param {event} <e> this parameter is event.
*/ 
function verifyPopulationAndClose(e){
   this.Status = StepStatus.Failed;
   var namePopulation = this.StepParams.NamePopulation;
   var plotEditorGeneral = getPlotEditorGeneral(this);
   var status = plotEditorGeneral.verifyPopulations(namePopulation);
   plotEditorGeneral.close();
   if (status){
      this.Status = StepStatus.Passed;
   } 
}
 
/* @description This function will be used for note the values of the populations.
* @param {event} <e> this parameter is event.
*/ 
function noteValuesPopulations(e){
   this.Status = StepStatus.Failed;
   var stepParams = this.StepParams;
   var nameColumns = stepParams.NameColumns;    
   var experimentView = getExperimentView(this);  
   experimentView.getFirstStatisticsGrid()
                 .logAllRows(nameColumns);       
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for note the sum of the events populations..
* @param {event} <e> this parameter is event.
*/ 
function noteSumEventsPopulations(e){
   this.Status = StepStatus.Failed;
   var stepParams = this.StepParams;
   var namePopulations = stepParams.NamePopulations;    
   var experimentView = getExperimentView(this);  
   experimentView.getFirstStatisticsGrid()
                 .logSum(namePopulations);        
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for verify that sum of the following number of events is equal to # of All Events.
* @param {event} <e> this parameter is event.
*/        
function verifySumEventsPopulation(e){
   this.Status = StepStatus.Failed;
   var namePopulations = this.StepParams.NamePopulations;
   var experimentView = getExperimentView(this);   
   var status =  experimentView.getFirstStatisticsGrid()
                               .verifySum(namePopulations);        
   if (status){
      this.Status = StepStatus.Passed;
   } 
}
 
/* @description This function will be used for note the sum of the events populations.
* @param {event} <e> this parameter is event.
*/ 
function selectPopulation(e){
   this.Status = StepStatus.Failed;  
   var namePopulation = this.StepParams.NamePopulation; 
   var plotEditor = getPlotEditor(this);
   var plotEditorGeneral = getPlotEditorGeneral(this);
   plotEditorGeneral.selectPopulation(namePopulation);                                      
   this.Status = StepStatus.Passed; 
}
    
/* @description This function will be used for close window 'Plot Property'
* @param {event} <e> this parameter is event.
*/ 
function closePlotProperties(e){
   this.Status = StepStatus.Failed;
   CloseEditPlot(this);                       
   this.Status = StepStatus.Passed; 
}
    
/* @description This function will be used for verify that sub population is displayed as the child of the population.
* @param {event} <e> this parameter is event.
*/ 
function verifySubPopulation(e){
   this.Status = StepStatus.Failed;
   var namePopulation = this.StepParams.NamePopulation;  
   var nameSubPopulation = this.StepParams.NameSubPopulation;     
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow();                                 
   var status = hierarchyWindow.verifyPopulation(namePopulation, nameSubPopulation);
   if (status){
      this.Status = StepStatus.Passed;
   } 
}

/* @description This function will be used for change parameter
* @param {event} <e> this parameter is event.
*/ 
function changePropertiesXParameters(e){
   this.Status = StepStatus.Failed;
   var stepParams = this.StepParams;
   var changeXParameter = {textXLabel: stepParams.changeXParameter};  
   var plotEditor = getPlotEditor(this);
   var plotEditorParameters = plotEditor.selectParametersTab();
   plotEditorParameters.setXLabel(changeXParameter);                      
   this.Status = StepStatus.Passed; 
}  
         
/* @description This function will be used for change parameter
* @param {event} <e> this parameter is event.
*/ 
function selectGeneralTab(e){
   this.Status = StepStatus.Failed;   
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   var plotEditorWindow = getExperimentView(this).waitPlotEditorWindow();
   plotEditorWindow.selectGeneralTab();           
   this.Status = StepStatus.Passed; 
}
      
/* @description This function will be used for verify that object is displayed in 'Primary Data Source'.
* @param {event} <e> this parameter is event.
*/ 
function verifyPopulations(e){
   this.Status = StepStatus.Failed;
   var namePopulation = this.StepParams.NamePopulation;
   var plotEditorGeneral = getPlotEditorGeneral(this);
   var status = plotEditorGeneral.verifyPopulations(namePopulation);
   if (status){
      this.Status = StepStatus.Passed;
   } 
}   
 
/* @description This function will be used for close gate properties window
* @param {event} <e> this parameter is event.
*/ 
function closeGatePropertiesWindow(e){
   this.Status = StepStatus.Failed;  
   closeGateProperties(this);                
   this.Status = StepStatus.Passed; 
}  
    
/* @description This function will be used select population and close plot propertiesw
* @param {event} <e> this parameter is event.
*/ 
function selectPopulationAndCloseProperties(e){
   SelectPopulations(this);
   CloseEditPlot(this);
}

/* @description This function will be used for change Y parameter
* @param {event} <e> this parameter is event.
*/ 
function changePropertiesYParameters(e){
   this.Status = StepStatus.Failed;
   var stepParams = this.StepParams;
   var changeYParameter = {textYLabel: stepParams.changeYParameter};  
   var plotEditor = getPlotEditor(this);
   var plotEditorParameters = plotEditor.selectParametersTab(); 
   plotEditorParameters.setYLabel(changeYParameter);                      
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used to verify axises
* @param {event} <e> this parameter is event.
*/ 
function openPlotPropertiesAndVerifyAxis(e){
   this.Status = StepStatus.Failed;
   var plotEditor = getPlotEditor(this);
   var plotEditorParameters = plotEditor.selectParametersTab(); 
   var status = verifyAxises(this); 
   if (status){
      this.Status = StepStatus.Passed;
   }  
}

/* @description This function will be used to select parametrs tab 
* @param {event} <e> this parameter is event.
*/ 
function selectParametersTabAndMakeBiExponential(e){
   this.Status = StepStatus.Failed; 
   var stepParams = this.StepParams;
   var XParamScale = stepParams.XParamScale;
   var YParamScale = stepParams.YParamScale; 
   var plotEditorParameters = selectParametersTab(this);
   plotEditorParameters.setParamsScale({XParamScale:XParamScale, YParamScale:YParamScale});
   plotEditorParameters.close();  
   this.Status = StepStatus.Passed; 
}
    
function closeHierarchyWindow(e){
   this.Status = StepStatus.Failed; 
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   hierarchyWindow.close();
   this.Status = StepStatus.Passed;                                     
}

/* @description This function will be used for select option 'OR' populations
* @param {event} <e> this parameter is event.
*/ 
function selectOptionOrPopulations(e){
   this.Status = StepStatus.Failed; 
   var namePopulations = this.StepParams.NamePopulations;    
   openHierarchyWindow(this);
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   hierarchyWindow.openAllExpandes();                                            
   hierarchyWindow.selectOptionOr(namePopulations);                        
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for verify that object is displayed in 'Hierarchy'.
* @param {event} <e> this parameter is event.
*/ 
function verifyPopulationsHierarchyAndPlotProperties(e){
   this.Status = StepStatus.Failed;
   var namePopulations = this.StepParams.NamePopulations;
   var experimentView = getExperimentView(this);
   var hierarchyWindow = experimentView.waitHierarchyWindow(); 
   var statusHierarchy = hierarchyWindow.verifyPopulations(namePopulations);                                 
   var plotEditor = getPlotEditor(this);  
   var plotEditorGeneral = plotEditor.selectGeneralTab(); 
   var status = plotEditorGeneral.verifyPopulations(namePopulations);
   plotEditorGeneral.close();
   if (status && statusHierarchy){
      this.Status = StepStatus.Passed;
   } 
}      

/* @description This function will be used for go to plot properties.
* @param {event} <e> this parameter is event.
*/ 
function navigatePlotPropertiesAndGeneralTab(e){
   this.Status = StepStatus.Failed;
   var plotEditor = getPlotEditor(this);  
   plotEditor.selectGeneralTab();        
   this.Status = StepStatus.Passed; 
} 
    
/* @description This function will be used for select option 'AND' populations
* @param {event} <e> this parameter is event.
*/ 
function selectOptionAndPopulations(e){
   this.Status = StepStatus.Failed; 
   var stepParams = this.StepParams; 
   var namePopulations = this.StepParams.NamePopulations;    
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   hierarchyWindow.openAllExpandes();     
   hierarchyWindow.selectOptionAND(namePopulations);                        
   this.Status = StepStatus.Passed; 
} 

/* @description This function will be used for verify that object is displayed in 'Hierarchy'.
* @param {event} <e> this parameter is event.
*/ 
function verifyPopulationsHierarchy(e){
   this.Status = StepStatus.Failed;
   var namePopulations = this.StepParams.NamePopulations; 
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   var status = hierarchyWindow.verifyPopulations(namePopulations);                                 
   if (status){
      this.Status = StepStatus.Passed;
   } 
}

/* @description This function will be used to select Undo keys
* @param {event} <e> this parameter is event.
*/ 
function selectUndo(e){
   this.Status = StepStatus.Failed; 
   var experimentPanelWorksheets = getExperimentPanelWorksheets(this);
   experimentPanelWorksheets.selectUndoButton();                 
   this.Status = StepStatus.Passed; 
} 
    
/* @description This function will be used for verify that object isn't displayed in 'Hierarchy'.
* @param {event} <e> this parameter is event.
*/ 
function verifyPopulationsInHierarchyDoNotDisplayed(e){
   this.Status = StepStatus.Failed;
   var namePopulations = this.StepParams.NamePopulations; 
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   var status = hierarchyWindow.verifyPopulations(namePopulations);                                 
   if (!status){
      this.Status = StepStatus.Passed;
   } 
}

/* @description This function will be used to select Redo via file menu
* @param {event} <e> this parameter is event.
*/ 
function redoViaFileMenu(e){
   this.Status = StepStatus.Failed; 
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   mainWindow.redoViaFileMenu();                
   this.Status = StepStatus.Passed; 
}   

/* @description This function will be used for verify Population Statistics Is The Same As Noted
* @param {event} <e> this parameter is event.
*/ 
function _verifyPopulationInTheGrid(e){
   this.Status = StepStatus.Failed;
   var stepParams = this.StepParams;
   var nameGate = stepParams.Gate; 
   var parameter = stepParams.Parameter;
   var result = stepParams.Result; 
   var gridType = stepParams.GridType;
   var experimentView = getExperimentView(this);
   var grid = experimentView.getStatisticsGridByName(gridType);
   var text = grid.getCellTextByName(parameter,nameGate); 
   var status  = +text === result;                         
    if (status) {
      this.Status = StepStatus.Passed; 
   }
} 

/* @description This function will be used for select option 'Delete' populations
* @param {event} <e> this parameter is event.
*/ 
function selectOptionDeletePopulations(e){
   this.Status = StepStatus.Failed; 
   var namePopulations = this.StepParams.NamePopulations;    
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   hierarchyWindow.openAllExpandes();     
   hierarchyWindow.selectOptionDelete(namePopulations);                        
   this.Status = StepStatus.Passed; 
}     

/* @description This function will be used for select option 'Rest of' populations
* @param {event} <e> this parameter is event.
*/ 
function selectOptionRestOfPopulations(e){
   this.Status = StepStatus.Failed; 
   var namePopulations = this.StepParams.NamePopulations;    
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   hierarchyWindow.openAllExpandes();     
   hierarchyWindow.selectOptionRestOf(namePopulations);                        
   this.Status = StepStatus.Passed; 
}    

/* @description This function will be used for change X label In Plot
* @param {event} <e> this parameter is event.
*/ 
function changeXLabelInPlot(e){
   this.Status = StepStatus.Failed;
   var txtXParameter = this.StepParams.txtXParameter;
   var txtYParameter = this.StepParams.txtYParameter; 
   var newXLabel = this.StepParams.newXLabel;
   var experimentPanelWorksheets= getExperimentPanelWorksheets(this);  
   var plot = experimentPanelWorksheets.findPlot({txtXParameter: txtXParameter, txtYParameter: txtYParameter});
   plot.txtXParameter.rightClick();   
   plot.txtXParameter.PopupMenu.click({Path: newXLabel});                
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for change Y label In Plot
* @param {event} <e> this parameter is event.
*/ 
function changeYLabelInPlot(e){
   this.Status = StepStatus.Failed;
   var txtXParameter = this.StepParams.txtXParameter;
   var txtYParameter = this.StepParams.txtYParameter; 
   var newYLabel = this.StepParams.newYLabel;
  
   var plot = getExperimentPanelWorksheets(this).findPlot({txtXParameter: txtXParameter, txtYParameter: txtYParameter});
   plot.txtYParameter.rightClick();   
   plot.txtYParameter.PopupMenu.click({Path: newYLabel});                
   this.Status = StepStatus.Passed;
}      
    
/* @description This function will be used for go to plot properties and select Parameters tab
* @param {event} <e> this parameter is event.
*/ 
function navigatePlotPropertiesAndParametersTab(e){
   this.Status = StepStatus.Failed;    
   var plotEditorParameters = selectPlotEditorParameters(this);
   this.Status = StepStatus.Passed; 
}  
 
/* @description This function will be used for go to plot properties and select Parameters tab
* @param {event} <e> this parameter is event.
*/ 
function verifyAxisOnParametersTabOnPropertyWindow(e){
   this.Status = StepStatus.Failed;
   var status = verifyAxises(this);
   if (status){
      this.Status = StepStatus.Passed;
   } 
}   
          
/* @description This function will be used for open General Tab And Update Primary Data Source
* @param {event} <e> this parameter is event.
*/ 
function openGeneralTabAndUpdatePopulation(e){
   this.Status = StepStatus.Failed;
   var namePopulation = this.StepParams.NamePopulation; 
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   var plotEditor = getExperimentView(this).waitPlotEditorWindow();
   var plotEditorGeneral = plotEditor.selectGeneralTab();
   plotEditorGeneral.selectPopulation(namePopulation);                    
   this.Status = StepStatus.Passed;
}
    
/* @description This function will be used for create quad gate
* @param {event} <e> this parameter is event.
*/ 
function createQuadGate(e){
   this.Status = StepStatus.Failed; 
   var stepParams = this.StepParams; 
   var txtXParameter = stepParams.txtXParameter;
   var txtYParameter = stepParams.txtYParameter; 
   var experimentPanelWorksheets = getExperimentPanelWorksheets(this);  
   experimentPanelWorksheets.selectQuadButton();
   var plot = experimentPanelWorksheets.findPlot({txtXParameter: txtXParameter, txtYParameter: txtYParameter});
   plot.click();                         
   this.Status = StepStatus.Passed; 
}  

/* @description This function will be used for select quad gate
* @param {event} <e> this parameter is event.
*/ 
function selectQuadGate(e){
   this.Status = StepStatus.Failed; 
   var stepParams = this.StepParams; 
   var txtXParameter = stepParams.txtXParameter;
   var txtYParameter = stepParams.txtYParameter; 
   var experimentPanelWorksheets =  getExperimentPanelWorksheets(this);
   var propertiesGateWindow = experimentPanelWorksheets.getPropertiesGateWindow({txtXParameter: txtXParameter, txtYParameter: txtYParameter, option:"F4", path:"Q1"});
   propertiesGateWindow.cast(FSGatePropertiesQuadWindow).StatisticsOnly.uncheck();
   this.Status = StepStatus.Passed; 
}       

/* @description This function will be used for close gate properies window and open plot properties
*  @param {event} <e> this parameter is event.
*/ 
function closeGatePropertiesWindowAndOpenPlotProperties(e){
   this.Status = StepStatus.Failed;  
   closeGateProperties(this);  
   getPlotEditor(this);                                                         
   this.Status = StepStatus.Passed; 
}
    
/* @description This function will be used for note the values of the RunPointerStatistics.
* @param {event} <e> this parameter is event.
*/ 
function noteRunPointerStatisticsValuesPopulations(e){
   this.Status = StepStatus.Failed;
   var stepParams = this.StepParams;
   var gridType = stepParams.GridType;   
   var experimentView = getExperimentView(this);
   var statistics = experimentView.getStatisticsFromGridByNameOfRow(gridType,'Events');
   Applications.setNotes(statistics);
   this.Status = StepStatus.Passed;
}

/* @description This function will be used for select option 'Delete' populations
* @param {event} <e> this parameter is event.
*/ 
function selectOptionDeletePopulationsAndConfirm(e){
   this.Status = StepStatus.Failed; 
   var namePopulations = this.StepParams.NamePopulations;    
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   hierarchyWindow.expandWindow();
   hierarchyWindow.openAllExpandes();     
   hierarchyWindow.selectOptionDelete(namePopulations);  
   hierarchyWindow.confirmDelete();     
   this.Status = StepStatus.Passed; 
}
 
/* @description This function will be used for verify if note is the save as was
* @param {event} <e> this parameter is event.
*/ 
function verifyStateViewIsTheSameasNoted(e){
   this.Status = StepStatus.Failed;
   var gridType = this.StepParams.GridType;
   var experimentView = getExperimentView(this);
   var statistics = experimentView.getStatisticsFromGridByNameOfRow(gridType,'Events');
   var status = Applications.verifyNotes(statistics);
   if (status) {
      this.Status = StepStatus.Passed; 
   }
} 

/* @description This function will be used for check Show Population Statistics
* @param {event} <e> this parameter is event.
*/ 
function checkShowPopulationStatistics(e){
   this.Status = StepStatus.Failed;
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   var statsCheckBox = hierarchyWindow.getShowPopulationStatsCheckBox();
   statsCheckBox.check();
   this.Status = StepStatus.Passed;
}    

/* @description This function will be used for verify Population Statistics Is The Same As Noted
* @param {event} <e> this parameter is event.
*/ 
function verifyPopulationStatisticsIsTheSameAsNoted(e){
   this.Status = StepStatus.Failed;
   var hierarchyWindow = getExperimentView(this).waitHierarchyWindow(); 
   hierarchyWindow.openAllExpandesPopulation(); 
   var notes =  Applications.getNotes();                         
   var status = hierarchyWindow.verifyPopulationsEvents(notes);
   if (status) {
      this.Status = StepStatus.Passed; 
   }
}
 
/* @description This function will be used to save Experiment
* @param {event} <e> this parameter is event.
*/ 
function saveAs(e){
   this.Status = StepStatus.Failed; 
   var nameExperiment = this.StepParams.NameExperiment; 
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   mainWindow.saveAsViaFileMenu();
   var saveFileDialog = Applications.getFacSuiteWindow(this)
                                    .waitForWindow({Text: "Save Experiment As ..."})
                                    .cast(FSSaveExperimentDialog);
   saveFileDialog.inputName(nameExperiment);
   saveFileDialog.clickOK();
   mainWindow.exitViaFileMenu();
   this.Status = StepStatus.Passed; 
} 
    
/* @description This function will be used for go to plot properties.
* @param {event} <e> this parameter is event.
*/ 
function openExperimentViaFileMenu(e){
   this.Status = StepStatus.Failed;
   var nameExperiment = this.StepParams.NameExperiment; 
   var mainWindow = Applications.getFacSuiteMainWindow(this);
   mainWindow.Workspaces.Items.ExperimentNavigateButton.click();
   var manageExperimentsView =  mainWindow.findTab(FSManageExperimentsView);
   manageExperimentsView.ExperimentsListView.click({Name: nameExperiment});
   mainWindow.openExperimentViaFileMenu();
   mainWindow.findTab(FSExperimentView);     
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
 
function closeGateProperties(object){
   var gatePropertiesWindow = getExperimentView(object).waitGatePropertiesWindow();                                   
   gatePropertiesWindow.close();  
}
 
function openHierarchyWindow(object){
   var experimentPanelWorksheets = getExperimentPanelWorksheets(object);
   experimentPanelWorksheets.selectDisplayHierarchyButton();            
} 
    
function getPlotEditorGeneral(object){
   var plotEditorWindow = getExperimentView(object).waitPlotEditorWindow();                                         
   var plotEditorGeneral = plotEditorWindow.findTab(FSPlotEditorGeneral);
   return plotEditorGeneral;
} 
    
function getPlotEditorParameters(object){
   var plotEditorWindow = getExperimentView(object).waitPlotEditorWindow();
   var plotEditorParameters = plotEditorWindow.findTab(FSPlotEditorParameters);
   return plotEditorParameters;
} 
    
function getPlotEditor(object){
   var stepParams = object.StepParams;
   var txtXParameter = stepParams.txtXParameter;
   var txtYParameter = stepParams.txtYParameter;
   var option = {txtXParameter: txtXParameter, txtYParameter: txtYParameter};  
   var plotEditorWindow = getExperimentPanelWorksheets(object) 
                                      .getPlotEditorWindow(option);  
   return plotEditorWindow;
} 
    
function SelectPopulations(object){
   var namePopulation = object.StepParams.NamePopulation; 
   getPlotEditor(object);
   var plotEditorGeneral = getPlotEditorGeneral(object);
   plotEditorGeneral.selectPopulation(namePopulation);    
}
 
function selectPlotEditorParameters(object){
   var stepParams = object.StepParams;
   var txtXParameter = stepParams.txtXParameter;
   var txtYParameter = stepParams.txtYParameter; 
   var option = {txtXParameter: txtXParameter, txtYParameter: txtYParameter};
   var plotEditorWindow = getExperimentPanelWorksheets(object) 
                                  .getPlotEditorWindow(option);  
   var plotEditorParameters = plotEditorWindow.selectParametersTab(); 
   return plotEditorParameters;
}   

function selectParametersTab(object){
   var mainWindow = Applications.getFacSuiteMainWindow(object);
   var plotEditor = getExperimentView(object).waitPlotEditorWindow();
   var plotEditorParameters = plotEditor.selectParametersTab();
   return plotEditorParameters;
}

/* @description This function will be used to select display hierarhy
* @param {event} <e> this parameter is event.
*/ 
function openDisplayHierarchy(e){
   this.Status = StepStatus.Failed;   
   openHierarchyWindow(this);         
   this.Status = StepStatus.Passed; 
}
    
function CloseEditPlot(object){
   var plotEditorWindow = getExperimentView(object).waitPlotEditorWindow();
   plotEditorWindow.close();
}

/* @description This function will be used for go to plot properties and select Parameters tab
* @param {object} <object> this parameter is object.
*/ 
function verifyAxises(object){
   var expectedXAxis = object.StepParams.txtXParameter;
   var expectedYAxis = object.StepParams.txtYParameter;
   var plotEditorParameters = getPlotEditorParameters(object);
   var status = plotEditorParameters.verifyAxis({X : expectedXAxis,Y : expectedYAxis}); 
   return status;
}
    