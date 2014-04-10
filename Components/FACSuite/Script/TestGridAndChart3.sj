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
    
    // exit normally through the menu
  //  app.exitViaFileMenu(); 
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
    // select tabs from the top of the workspace
    for (i=0; i< 2; i++) {
    workspace.select({Text: "Manage"});
    aqUtils.Delay(1000);
    workspace.select({Text: "Worklist_001"});
    aqUtils.Delay(1000);
    
    }
   
}

function ManageWorklistView(view){

  Log.Message("I am in ManageWorklistView");
   /*
    view
        .ExperimentsShortcuts
        .click({Text: "All Experiments"});       
    
    if (view.ExperimentsListView.Items.length > 0){
        view.ExperimentsListView.doubleClick({Name: "Experiment_001"});
    }   
    */
}

function WorklistView(view){
                     
  /*  var stats = view
        .StatisticsGrids;
            
    if (stats && stats.length > 0){
        stats[0].log(); 
    }                  
        
    var grids = view.PlotGrids;                            
            
    if (grids && grids.length > 0){
        for(var prop in grids){
            grids[prop].rightClick();
            aqUtils.Delay(3000);
           
           grids[prop]
                .PopupMenu
                .click({Path: "Properties"}); 
            
            
            grids[prop].log(); 
        }        
    } 
    */ 
    test_worklist_page(view);           
}
function test_worklist_page(view) {
   Log.Message("in test worklist page");
   run_the_test(view);
}
function run_the_test(view){
   Log.Message("in test worklist page");
   
   /*
   var entryDetailsPanel = view.cast(FSWorklistPanelEntryDetails);
   Log.Message("in test worklist entryDetailsPanel page after");
   options = { currentTube: 'Tube_001' };
   //entryDetailsPanel.setCurrentTube(options);
   entryDetailsPanel.addWorksheet(options);
   aqUtils.Delay(1000);
   */
   
   /*
   var tasksPanel = view.cast(FSWorklistPanelTasks);
   Log.Message("in test worklist page after");
   options = { sampleIDPrefix: 'myPrefix', number: '3' };
   aqUtils.Delay(1000);
   tasksPanel.setSampleIDPrefix(options);
   aqUtils.Delay(1000);
   tasksPanel.setNumber(options);
   aqUtils.Delay(2000);
   */
   
   
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
   
   /*
    var workspace1 = view
                .Finder
                .find({ClrClassName : "Workspace", Depth: 40})
                .cast(Element); 
                
   var panes = workspace1
                .Finder
                .findAll({ClrClassName : "WorkspacePane", VisibleOnScreen: true, Enabled: true, Depth: 40});
            
            for(var prop in panes){
            Log.Message( "in prop in panes");
            
                var pane = panes[prop].cast(WPFWorkspacePane);
                
                if (pane.Buttons.Maximize.Visible){
                    pane.Buttons.Maximize.click(); 
                }
                // TODO -cFramework -oNoel : push the refresh back into the buttons collection. 
                // Note: may need to wrap each method (Restore, Maximize, Close) in a custom method that 
                // includes refresh and override the default methods with these versions.
                pane.Buttons.Restore.refresh(); 
                if (pane.Buttons.Restore.Visible){
                    pane.Buttons.Restore.click(); 
                }                
                pane.log(); 
                
            }  
      */
   
   
   
   
   
   
 //  aqUtils.Delay(3000);
  // acquisitionPanel.Close();
   
   
  // var userManagementWindow = app
     //   .waitForWindow({Text: "User Management"})
    //    .cast(FSUserManagement); 
     

   
}