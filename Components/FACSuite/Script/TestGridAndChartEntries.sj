//USEUNIT FS_FACSuite

////USEUNIT FS_WorklistPanelAcquisition
//USEUNIT FS_AcquisitionPanel

//USEUNIT FS_WorklistPanelTasks
//USEUNIT FS_WorklistPanelWorklistEntries
////USEUNIT FS_WorklistPanelEntryDetails
////USEUNIT BD_UnitTest
////USEUNIT BD_FrameworkClassIncludes

// This test requires an experiment named Experiment_001 be present in the list.
// To log both statistics and plotgrid, add both to the experiment.

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
    workspaces.select({Text: "Worklists"});
    
    var workspace = workspaces.Current;
    
    // demonstrate tabbing around. 
    // Notice I always have to go between
    // the manage class and the worklist
    // view class. I cannot go from Worklist_001
    // to Worklist_002. We can live with this,
    // in fact, usually you don't want to go 
    // from Workspace_001 to Workspace_002. 
    workspace.select({Text: "Manage"});    
    workspace.select({Text: "Worklist_001"});
    workspace.select({Text: "Manage"}); 
    workspace.select({Text: "Worklist_002"});
    workspace.select({Text: "Manage"});
    ManageWorklistView(workspace.Current);
    workspace.select({Text: "Worklist_001"});
    WorklistView(workspace.Current);
  
}

function ManageWorklistView(view){

   Log.Message("WORKLIST. I am in ManageWorklistView");
  
}

function WorklistView(view){
                     
   Log.Message("WORKLIST. I am in WorklistView");
   acq_test(view);
   task_test( view );
   worklist_entries_test( view );         
}

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