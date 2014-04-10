//USEUNIT FS_ExperimentPanelWorksheets

// This test requires an experiment named Experiment_001 be present in the list.
// Make sure you have at least 1 tube otherwise when you right click after the plot,
// you will not get the menu. 
 
function test(){
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
  
}

function ManageExperimentView(view){

   Log.Message("Experiment. I am in ManageExperimentView");
  
}

function ExperimentView(view){
                     
   Log.Message("Experiment. I am in ExperimentView");
   Log.Message("just got in experiment view:" + aqDateTime.Now());
   
   runDemo(view);
  
 // var options = { Type: 'DotPlot2D', XParamName: 'FSC-A', YParamName: 'SSC-A',
 //                 endX: 50, endY: 50 }; 
 //  create2D_RightClick_test(view );
 
 // var options = {  XParamName: 'SSC-A', XParamScale: 'Log', endX: 300, endY: 50 };
  // create1D_LeftClick_test(view);
   
  // create2D_LeftClick_test(view);
  
   //acq_test(view);
   //task_test( view );
   //worklist_entries_test( view );         
}

// Demo which tests steps 1.3 - 1.6  
function runDemo(view) {

   
   var experimentPanel = view.cast(FSExperimentPanelWorksheets);
   
   
   // Draw first plot 
   var options = { Type: 'DotPlot2D', XParamName: 'PerCP-Cy5.5-A', YParamName: 'SSC-A',
                  endX: 50, endY: 50 };
   experimentPanel.create2D_RightClick(options);
   
   // Draw second plot  
   var options = { Type: 'DotPlot2D', XParamName: 'FSC-A', YParamName: 'SSC-A',
                  endX: 300, endY: 50 };
   experimentPanel.create2D_RightClick(options);
   
   // Find plot
   //var options = { txtXParameter: 'PerCP-Cy5.5-A', txtYParameter: 'SSC-A', Title: 'Tube_002 - All Events' };
   var options = { txtXParameter: 'PerCP-Cy5.5-A', txtYParameter: 'SSC-A' };
   //  var options = { txtXParameter: 'PerCP-Cy5.5-A' };
   
   var myplot1 = experimentPanel.findPlot(options);
   if ( typeof(myplot1) === "string" ) { // did not find the plot or found too many plots. 
      Log.Message("You had an error in findPlot" + myplot1);
   }
   
   // Draw the gate on the plot you just found
   var options = { Type: 'Rectangle', startX: '75', startY: '25', endX: '105', endY: '115' };
   experimentPanel.drawGate( myplot1, options );
  
   // Rename the gate
   var options = { txtName: 'MNEs', startX: '75', startY: '25' };
   experimentPanel.renameGate( myplot1, options );
      
}

// Test the keyword create2D_RightClick
function create2D_RightClick_test(view) {

 // var x = new SqeKeyword()
            //    .setStepNumber("1.0")
               // .setKeywordParams({UserID: "BDAdministrator", Password: "bdadministrator"});
 

   var experimentPanel = view.cast(FSExperimentPanelWorksheets);
   
   // get on the right tab. be default we are on the right tab. 
   experimentPanel.WorksheetTabControl.click({Text: "Worksheet_001"});
  // experimentPanel.WorksheetTabControl.click({Text: "Worksheet_002"}); 
  // experimentPanel.WorksheetTabControl.click({ byIndex: 2});
  
   var options = { Type: 'DotPlot2D', XParamName: 'FSC-A', YParamName: 'SSC-A',
                  endX: 50, endY: 50 };
   experimentPanel.create2D_RightClick(options);
  
}

// Test the keyword create1D_LeftClick
function create1D_LeftClick_test(view) {
 
   var experimentPanel = view.cast(FSExperimentPanelWorksheets);
   
   // get on the right tab. by default we are on the right tab
   experimentPanel.WorksheetTabControl.click({Text: "Worksheet_001"});
  // experimentPanel.WorksheetTabControl.click({Text: "Worksheet_002"}); 
  // experimentPanel.WorksheetTabControl.click({ byIndex: 2});
  
   
   var options = {  XParamName: 'SSC-A', endX: 300, endY: 50 };
   experimentPanel.create1D_LeftClick(options);
   
}

// Test the keyword create2D_LeftClick
function create2D_LeftClick_test(view) {
 
   var experimentPanel = view.cast(FSExperimentPanelWorksheets);
   
   // get on the right tab. by default we are on the right tab
   experimentPanel.WorksheetTabControl.click({Text: "Worksheet_001"});
   // experimentPanel.WorksheetTabControl.click({Text: "Worksheet_002"});
   // experimentPanel.WorksheetTabControl.click({ byIndex: 2});
  
   var options = { Type: 'DotPlot2D', XParamName: 'FSC-A', YParamName: 'SSC-A',
                  endX: 50, endY: 300 };
   experimentPanel.create2D_LeftClick(options);
   
}

// Below here we are testing other panels
function acq_test(view){
   Log.Message("in test worklist page"); 
   
   var acquisitionPanel = view.cast(FSWorklistPanelAcquisition);
   Log.Message("in test worklist page after");
   
   options = { flowRate: 'Low', eventsToDisplay: '500' };
   acquisitionPanel.setFlowRate(options);
   aqUtils.Delay(1000);
   acquisitionPanel.setEventsToDisplay(options);
   aqUtils.Delay(1000);
   
   options = { flowRate: 'Medium', eventsToDisplay: '1000' };
   acquisitionPanel.setFlowRate(options);
   aqUtils.Delay(1000);
   acquisitionPanel.setEventsToDisplay(options);
   aqUtils.Delay(1000);
   
   var time1 = acquisitionPanel.getTime();
   Log.Message ( "WL AcqPanel time is " + time1 );
   var processedEvents = acquisitionPanel.getProcessedEvents();
   Log.Message ( "WL AcqPanel processedEvents is " + processedEvents );
   var thresholdEvents = acquisitionPanel.getThresholdEvents();
   Log.Message ( "WL AcqPanel thresholdEvents is " + thresholdEvents );
   var thresholdRate = acquisitionPanel.getThresholdRate();
   Log.Message ( "WL AcqPanel threshold rate is " + thresholdRate );
}

function task_test(view) {   
   var tasksPanel = view.cast(FSWorklistPanelTasks);
   Log.Message("in test worklist page after");
   
   options = { sampleIDPrefix: 'AceLabs', number: '1' };
   for (j = 0; j <2; j++) {
   for (i = 0; i< 3; i++) {
      
      //aqUtils.Delay(1000);
      tasksPanel.setSampleIDPrefix(options);
      //aqUtils.Delay(1000);
      tasksPanel.setNumber(options);
      //aqUtils.Delay(1000);
      tasksPanel.addWorkItemButton( );
      aqUtils.Delay(1000);
   }
   options = { sampleIDPrefix: 'PfetXLabs', number: '1' };
   }
   
}

function worklist_entries_test( view ) {
   var worklistEntriesPanel = view.cast(FSWorklistPanelWorklistEntries );
   worklistEntriesPanel.getGridTask(0);
   worklistEntriesPanel.getGridTask(1);
   worklistEntriesPanel.getGridTask(2);
   
   worklistEntriesPanel.getGridLocation(0);
   worklistEntriesPanel.getGridLocation(1);
   worklistEntriesPanel.getGridLocation(2);
   
   worklistEntriesPanel.getGridStatus(0);
   worklistEntriesPanel.getGridStatus(1);
   worklistEntriesPanel.getGridStatus(2);
   
   worklistEntriesPanel.getGridSampleID(0);
   worklistEntriesPanel.getGridSampleID(1);
   worklistEntriesPanel.getGridSampleID(2);
   
   worklistEntriesPanel.getGridCell(2,"SampleID");
   worklistEntriesPanel.getGridCell(2,"Task");
   worklistEntriesPanel.getGridCell(2,"Status");
   worklistEntriesPanel.getGridCell(2,"Location");
   worklistEntriesPanel.getGridCell(2,"SampleCarrier");
   worklistEntriesPanel.getGridCell(2,"AcquisitionTime");
   worklistEntriesPanel.getGridCell(2,"TubeID");
   
   worklistEntriesPanel.setTask(0,0);
   aqUtils.Delay(1000);
   worklistEntriesPanel.setTask(1,1);
   aqUtils.Delay(1000);
   worklistEntriesPanel.setTask(2,2);
   aqUtils.Delay(1000);
   worklistEntriesPanel.setTask(3,0);
   aqUtils.Delay(1000);
}