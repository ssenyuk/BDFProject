//USEUNIT FS_FACSuite

// This test requires an experiment named Experiment_001 and Experiment_002 be present in the list.

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
        .ExperimentsListView.doubleClick({Name: "Experiment_005"});

    // select the experiment 001 tab that has been created
    workspace.select({Text: "Experiment_005"});
            
    // select the manage tab
    workspace.select({Text: "Manage Experiments"});             
    
    // create the experiment 001 tab
    workspace
        .Current
        .ExperimentsListView.doubleClick({Name: "Experiment_005"});

    // select the experiment 001 tab that has been created
    workspace.select({Text: "Experiment_005"});
    workspace.log(); 
        
    // exit normally through the menu
    app.exitViaFileMenu(); 
}