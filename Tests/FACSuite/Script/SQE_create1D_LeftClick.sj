//USEUNIT BD_SqeKeyword 
//USEUNIT FS_ExperimentPanelWorksheets  
//USEUNIT CM_ApplicationHelper

/* @description This function is keyword 'Create1D_LeftClick'
*/ 
var Create1D_LeftClick = {
   Description: "Create 1D left click",        
   Steps: [
      new StepExecution({
         Description: "create 1D left click",
         StepFunction: _Create1D_LeftClick
      })             
   ]
}; 
    
/* @ignore
* @description This function will be used to create gate.
* @param {event} <e> this parameter is event.
*/ 
function _Create1D_LeftClick(e){
   this.Status = StepStatus.Failed;
   var XParamName = this.Parent.KeywordParams.XParamName;  
   var options = {startX:1, startY:1, endX: 1, endY: 350, textXLabel: XParamName}; 
   var mainWindow = Applications.getFacSuiteMainWindow(this);  
   var paneWorksheets = mainWindow.findTab(FSExperimentPanelWorksheets);
   paneWorksheets.create1D_LeftClick(options);                                      
   this.Status = StepStatus.Passed; 
}