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

   var workspaces = app
        .MainWindow
        .Workspaces;

    // react when a new workspace is active
   /* workspaces.subscribe("OnItemChanged", 
        function(e){
            var workspace = e.Sender.Current;   
            if (workspace.Name == "WorklistsLandingView"){
                WorklistWorkspace(workspace); 
            }
        });
        */
        WorklistWorkspace(); 
    // select a navigation icon from the left hand toolbar     
   // workspaces.select({Text: "Worklists"});
    
    // exit normally through the menu
  //  app.exitViaFileMenu(); 
}

function WorklistWorkspace(){
    workspace
        .subscribe("OnItemChanged", 
            function(e){
                var view = e.Sender.Current;
                
                 if (view.Name == "ManageWorklistView"){
               
                    Log.Message("hi"); 
                } else {
                    WorklistView(view);     
                }
            });
  
    workspace.select({Text: "Manage"});
    aqUtils.Delay(1000);
    workspace.select({Text: "Worklist_001"});
    aqUtils.Delay(1000);
    

    
   
}
function WorklistView(view){ 

   x = view;
   x.dosomething();

}               
