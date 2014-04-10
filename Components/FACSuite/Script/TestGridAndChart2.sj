//USEUNIT FS_FACSuite

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
            if (workspace.Name == "ExperimentsLandingView"){
                ExperimentsWorkspace(workspace); 
            }
        });
    // select a navigation icon from the left hand toolbar     
    workspaces.select({Text: "Experiments"});
    
    // exit normally through the menu
    app.exitViaFileMenu(); 
}

function ExperimentsWorkspace(workspace){
    workspace
        .subscribe("OnItemChanged", 
            function(e){
                var view = e.Sender.Current;
                 
                if (view.Name == "ManageExperimentsView"){
                    ManageExperimentsView(view); 
                } else {
                    ExperimentView(view);     
                }
            });
    // select tabs from the top of the workspace
    for (i=0; i< 1; i++) {
    workspace.select({Text: "Manage Experiments"});
    aqUtils.Delay(1000);
    workspace.select({Text: "Experiment_001"});
    aqUtils.Delay(1000);
    }
}

function ManageExperimentsView(view){
    view
        .ExperimentsShortcuts
        .click({Text: "All Experiments"});       
    
    if (view.ExperimentsListView.Items.length > 0){
        view.ExperimentsListView.doubleClick({Name: "Experiment_001"});
    }   
}

function ExperimentView(view){
                     
    var stats = view
        .StatisticsGrids;
            
    if (stats && stats.length > 0){
        stats[0].log(); 
    }                  
        
    var grids = view.PlotGrids;                            
            
    if (grids && grids.length > 0){
        for(var prop in grids){
            grids[prop].rightClick();
            aqUtils.Delay(3000);
           
            
            grids[prop].log(); 
        }        
    }             
}