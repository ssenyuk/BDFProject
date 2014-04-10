//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT SQE_LogOutLogIn 


//USEUNIT SQE_create2D_RightClick

//USEUNIT FS_FACSuite
////USEUNIT FS_ExperimentPanelAcquisition

//USEUNIT FS_ExperimentPanelWorksheets
//USEUNIT FS_SelectPlotParameters

////USEUNIT FS_WorklistPanelEntryDetails
////USEUNIT BD_UnitTest
////USEUNIT BD_FrameworkClassIncludes


 

var case1 = 
    new VerificationCase({
        CaseNumber: "1",
        Description: "FSS-FAQ-1559 - After data acquisition, parameter labels shall be preserved in the FCS file.",
        Steps: [
             
            new SqeKeyword(LogOutLogIn)
                .setStepNumber("1.0")
                .setKeywordParams({UserID: "BDAdministrator", Password: "bdadministrator"}), 

            new StepExecution({
                StepNumber: "1.1",
                Description: "Create a new experiment.",
                StepFunction: function(e){
                    Log.Message(e.Step.StepNumber + "  " + e.Step.Description); 
                    Delay(100);
                   
                    // save a simple value in params for retrieval by following step
                    var _case = e.Step.Parent;
                    var vp = _case.Parent; 
                    vp.Params["MyData"] = "Saved data associated with VP"; 
                    _case.Params["MyData"] = "Saved data associated with case"; 
                    e.Step.Params["MyData"] = "Saved data associated with step"; 
                   
                    


// This test requires an experiment named Experiment_001 be present in the list.
// To log both statistics and plotgrid, add both to the experiment.

//function test(){
    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            });  
                
    var workspaces = app
        .MainWindow
        .Workspaces;

         // select a navigation icon from the left hand toolbar     
    workspaces.select({Text: "Experiments"});
    
    var workspace = workspaces.Current;
    
    // demonstrate tabbing around. 
    // Notice I always have to go between
    // the manage class and the worklist
    // view class. I cannot go from Worklist_001
    // to Worklist_002. We can live with this,
    // in fact, usually you don't want to go 
    // from Workspace_001 to Workspace_002. 
    
/*
    workspace.select({Text: "Manage Experiments"});    
    workspace.select({Text: "Experiment_001"});
    workspace.select({Text: "Manage Experiments"}); 
    //workspace.select({Text: "Worklist_002"});
    //workspace.select({Text: "Manage"});
    ManageExperimentView(workspace.Current);
*/
    workspace.select({Text: "Experiment_001"});
    Log.Message("before calling exp view:" + aqDateTime.Now());
    ExperimentView(workspace.Current);
  
//}
              
                     
                    e.Step.Status = StepStatus.Passed; 
                },
                Steps: [
                    new StepExecution({
                        StepNumber: "1.1.A",
                        Description: "Create a new experiment substep 1.",
                        StepFunction: function(e){
                            Log.Message(e.Step.StepNumber + "  " + e.Step.Description); 
                            Delay(100);
                            e.Step.Status = StepStatus.Passed;
                        }
                    }) 
                ]                
            }),  
            new StepExecution({
                StepNumber: "1.2",
                Description: "Go to Tube Properties -> Reagents tab and assign CD3 to FITC.",
                StepFunction: function(e){
                    Log.Message(e.Step.StepNumber + "  " + e.Step.Description); 
                    
                    // retrieve variable from previous step
                    var _case = e.Step.Parent;
                    var vp = _case.Parent; 
                    Log.Message(_case.Steps[1].Params.MyData); 
                    
                    Delay(100);
                    e.Step.Status = StepStatus.Failed;  
                } 
            }),
            new StepVerification({
                StepNumber: "1.3",
                Description: "Verify that Plot is displaying CD3 FITC as parameter.",
                StepFunction: function(e){
                    Log.Message(e.Step.StepNumber + "  " + e.Step.Description); 
                    Delay(100);             
                    e.Step.Status = StepStatus.Passed; 
                } 
            }) 
        ]                
    })  
    
    
    
    
function ManageExperimentView(view){

   Log.Message("Experiment. I am in ManageExperimentView");
  
}

function ExperimentView(view){
                     
   Log.Message("Experiment. I am in ExperimentView");
   Log.Message("just got in expe view:" + aqDateTime.Now());
   //aqUtils.Delay(1000);
  // Sys.Keys("[F4]");
  // aqUtils.Delay(700);
   
   
  // runDemo(view);
   var options = { Type: 'DotPlot2D', XParam: 'FSC', YParam: 'SSC',
                  endX: 50, endY: 50 };
   create2D_RightClick_test(view );
  //var options = {  XParamName: 'SSC-A', XParamScale: 'Log', endX: 300, endY: 50 };
  // create1D_LeftClick_test(view);
   
  // create2D_LeftClick_test(view);
   //acq_test(view);
   //task_test( view );
   //worklist_entries_test( view );         
}
function runDemo(view) {

   var experimentPanel = view.cast(FSExperimentPanelWorksheets);
   
  // var options = { Type: 'DotPlot2D', XParam: 'FSC-A', YParam: 'SSC-A',
  //                endX: 50, endY: 50 };
  var options = { Type: 'DotPlot2D', XParam: 'FSC', YParam: 'SSC',
                  endX: 50, endY: 50 };
   experimentPanel.create2D_RightClick(options);
   
  // var options = {  XParam: 'FSC-A', endX: 300, endY: 50 };
   var options = {  XParamName: 'SSC-A', XParamScale: 'Log', endX: 300, endY: 50 };
   experimentPanel.create1D_LeftClick(options);
   
   var options = { Type: 'DotPlot2D', XParamName: 'FITC-A', YParamName: 'SSC-A',
                  XParamScale: 'Log', YParamScale: 'Log', endX: 50, endY: 300 };
   experimentPanel.create2D_LeftClick(options);
   

}
function create2D_RightClick_test(view) {
 
   var experimentPanel = view.cast(FSExperimentPanelWorksheets);
   
   
   var options = { type: 'DotPlot2D', XParam: 'FSC-A', YParam: 'SSC-A' };
   experimentPanel.WorksheetTabControl.click({Text: "Worksheet_001"});
  // experimentPanel.WorksheetTabControl.click({Text: "Worksheet_002"});
   
  // experimentPanel.WorksheetTabControl.click({ byIndex: 2});
  
   var options = { Type: 'DotPlot2D', XParam: 'FSC-A', YParam: 'SSC-A',
                  endX: 50, endY: 50 };
   experimentPanel.create2D_RightClick(options);
   
}

function create1D_LeftClick_test(view) {
 
   var experimentPanel = view.cast(FSExperimentPanelWorksheets);
   
   
  // var options = {  XParam: 'FSC-A', endX: 200, endY: 200 };
   experimentPanel.WorksheetTabControl.click({Text: "Worksheet_001"});
  // experimentPanel.WorksheetTabControl.click({Text: "Worksheet_002"});
   
  // experimentPanel.WorksheetTabControl.click({ byIndex: 2});
  
   
   var options = {  XParamName: 'SSC-A', endX: 300, endY: 50 };
   experimentPanel.create1D_LeftClick(options);
   
}
function create2D_LeftClick_test(view) {
 
   var experimentPanel = view.cast(FSExperimentPanelWorksheets);
   
   
   var options = { type: 'DotPlot2D', XParam: 'FSC-A', YParam: 'SSC-A' };
   experimentPanel.WorksheetTabControl.click({Text: "Worksheet_001"});
  // experimentPanel.WorksheetTabControl.click({Text: "Worksheet_002"});
   
  // experimentPanel.WorksheetTabControl.click({ byIndex: 2});
  
   var options = { Type: 'DotPlot2D', XParam: 'FSC-A', YParam: 'SSC-A',
                  endX: 50, endY: 300 };
   experimentPanel.create2D_LeftClick(options);
   
}                  
                     
