//USEUNIT BD_StepExecution
//USEUNIT BD_SqeKeyword
//USEUNIT CM_ApplicationHelper
//USEUNIT FS_ExperimentPanelWorksheets

var create2D_RightClick = 
    {
        Description: "Create 2D plot by right click",        
        Steps: [
            new StepExecution({
                Description: "Create2D plot and right click",
                StepFunction: _Create2D_RightClick
            })             
        ]
    }; 
    
    function _Create2D_RightClick( view ){
     this.Status = StepStatus.Failed; 

     var keywoardParams = this.Parent.KeywordParams;
     var XParamName = keywoardParams.XParamName;
     var YParamName = keywoardParams.YParamName;
     var options = { XParamName: XParamName, YParamName: YParamName};
     
     var mainWindow = Applications.getFacSuiteMainWindow(this);
     var experimentPanelWorksheets =  mainWindow.findTab(FSExperimentPanelWorksheets);   
     experimentPanelWorksheets.createPlot2D(options);                 

     this.Status = StepStatus.Passed; 
}