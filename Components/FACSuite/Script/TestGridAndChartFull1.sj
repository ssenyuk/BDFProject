//USEUNIT FS_FACSuite
//USEUNIT FS_WorklistPanelAcquisition
//USEUNIT FS_WorklistPanelTasks
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
    
    // select the manage tab
    workspace.select({Text: "Manage"});    
    workspace.select({Text: "Worklist_001"});
  //  workspace.select({Text: "Worklist_002"});
    workspace.select({Text: "Manage"}); 
     Log.Message("hello");   
    workspace.select({Text: "Worklist_002"});
   // Log.Message("hello");
   // workspace.select({Text: "Worklist_002"});
    
     workspace.select({Text: "Manage"}); 
     Log.Message("hello 2nd round");   
    workspace.select({Text: "Worklist_002"}); 
    Log.Message("hello1 2nd round");     
    /*        
    var workspace = workspaces.Current;
    
    // select the manage tab
    workspace.select({Text: "Manage Experiments"});

    // make sure that all experiment tabs are visible
    workspace
        .Current
        .ExperimentsShortcuts
        .click({Text: "All Experiments"});              
    
    // create the experiment 001 tab
    workspace
        .Current
        .ExperimentsListView.doubleClick({Name: "Experiment_001"});

    // select the experiment 001 tab that has been created
    workspace.select({Text: "Experiment_001"});
            
    // select the manage tab
    workspace.select({Text: "Manage Experiments"});             
    
    // create the experiment 001 tab
    workspace
        .Current
        .ExperimentsListView.doubleClick({Name: "Experiment_002"});

    // select the experiment 001 tab that has been created
    workspace.select({Text: "Experiment_002"});
    workspace.log();     
    */    
        
        
        

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
    for (i=0; i< 2; i++) {
    workspace.select({Text: "Manage"});
    aqUtils.Delay(1000);
    workspace.select({Text: "Worklist_002"});
    aqUtils.Delay(1000);
    workspace.select({Text: "Manage"});
    aqUtils.Delay(1000);
    Log.Message("after Worklist_001");
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
  run_the_test(view);
           
}

function run_the_test(view){
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
    
   var tasksPanel = view.cast(FSWorklistPanelTasks);
   Log.Message("in test worklist page after");
   options = { sampleIDPrefix: 'myPrefix', number: '3' };
   aqUtils.Delay(1000);
   tasksPanel.setSampleIDPrefix(options);
   aqUtils.Delay(1000);
   tasksPanel.setNumber(options);
   aqUtils.Delay(2000);
   
   var time1 = acquisitionPanel.getTime();
   Log.Message ( "Acquisition time is " + time1 );
   
   
}