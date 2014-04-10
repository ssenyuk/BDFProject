//USEUNIT FS_FACSuite

function test(){
    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            }); 
                
    workspaces = app
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
                }
            });
    // select tabs from the top of the workspace
    workspace.select({Text: "Manage Experiments"});
}

function ManageExperimentsView(view){
    view
        .ExperimentsShortcuts
        .click({Text: "All Experiments"});       
    
    if (view.ExperimentsListView.Items.length > 0){
        view.ExperimentsListView.doubleClick({Name: "Experiment_001"});
    }   
}