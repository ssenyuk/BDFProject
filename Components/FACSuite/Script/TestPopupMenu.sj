//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_FACSuite

// !! warning !! This test deletes experiments

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
                } 
            });
    // select tabs from the top of the workspace
    workspace.select({Text: "Manage Experiments"});
}

function ManageExperimentsView(view){
    view
        .ExperimentsShortcuts
        .click({Text: "All Experiments"});   
            
    var listView = view.ExperimentsListView; 
    for(var prop in listView.Items){
        
        var item = listView.Items[prop];
        
        if (item && item.Name){
            listView
                .click({Name: item.Name})
                .rightClick();
    
            listView
                .PopupMenu
                .click({Path: "Delete Experiment"}); 
    
            var confirmationWindow = view
                .App
                .waitForWindow({Text: "Delete Experiment"})
                .cast(WPFConfirmationWindow); 
                       
            confirmationWindow
                .Buttons
                .click({Text: "Yes"});
        } 
    }    
}