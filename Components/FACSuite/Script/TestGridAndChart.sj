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
    workspace.select({Text: "Manage Experiments"});
    workspace.select({Text: "Experiment_006"});
}

function ManageExperimentsView(view){
    view
        .ExperimentsShortcuts
        .click({Text: "All Experiments"});       
    
    if (view.ExperimentsListView.Items.length > 0){
        view.ExperimentsListView.doubleClick({Name: "Experiment_006"});
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
            grids[prop].log(); 
        }        
    }             
}