//USEUNIT FS_FACSuite
//USEUNIT FS_WorklistPanelAcquisition
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

    // react when a new workspace is active
    workspaces.subscribe("OnItemChanged", 
        function(e){
            var workspace = e.Sender.Current;   
            if (workspace.Name == "WorklistsLandingView"){
                WorklistWorkspace(workspace); 
            }
        });
        
    // select a navigation icon from the left hand toolbar     
    workspaces.select({Text: "Worklists"});
    
  
}

function WorklistWorkspace(workspace){

    workspace
        .subscribe("OnItemChanged", 
            function(e){
                var view = e.Sender.Current;
                 
                if (view.Name == "ManageWorklistView"){
               
                    ManageWorklistView(view); 
                } else {
                    WorklistView(view);     
                }
            });
   /*  
   workspace
        .subscribe("OnSelected", 
            function(e){
                var view = e.Sender.Current;
                 
               // if (view.Name == "Worklist_002"){
                   Log.Message("onSelected Worklist_002");
                   // ManageWorklistView(view); 
               // } else {
                   // WorklistView(view);     
               // }
            });
  */                
   
   
    
    // select tabs from the top of the workspace
    // This is done using subscriptions
    for (i=0; i< 1; i++) {
    workspace.select({Text: "Manage"});
    aqUtils.Delay(1000);
    //workspace.select({Text: "Worklist_002"});
   // aqUtils.Delay(1000);
   // workspace.select({Text: "Manage"});
   // aqUtils.Delay(1000);
   // Log.Message("after Worklist_001");
    workspace.select({Text: "Worklist_001"});
    aqUtils.Delay(1000);
    Log.Message("after Worklist_001");
    }
   
}

function ManageWorklistView(view){

  Log.Message("I am in ManageWorklistView");
  
}

function WorklistView(view){
                     
  Log.Message("I am in WorklistView");
 // acq_test(view);
  //task_test(view);
  worklist_entries_test(view);         
}

function acq_test(view){
   Log.Message("in test worklist page"); 
   
   var acquisitionPanel = view.cast(FSWorklistPanelAcquisition);
   Log.Message("in test worklist page after");
   
   options = { flowRate: 'Low', eventsToDisplay: '500' };
   acquisitionPanel.setFlowRate(options);
   aqUtils.Delay(1000);
   acquisitionPanel.setEventsToDisplay(options);
   aqUtils.Delay(2000);
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
   options = { sampleIDPrefix: 'myPrefix', number: '3' };
   aqUtils.Delay(1000);
   tasksPanel.setSampleIDPrefix(options);
   aqUtils.Delay(1000);
   tasksPanel.setNumber(options);
   aqUtils.Delay(2000);
   tasksPanel.addWorkItemButton( );
   aqUtils.Delay(2000);
   
   
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
   
   worklistEntriesPanel.setTask(1,3);

}