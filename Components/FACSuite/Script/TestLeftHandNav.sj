//USEUNIT FS_FACSuite

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
            
    workspaces.subscribe("OnItemChanged", 
        function(e){
            var workspace = e.Sender.Current; 
            workspace.log(); 
        });
             
    workspaces.select({Text: "Home"});
    workspaces.select({Text: "Experiments"});
    workspaces.select({Text: "Setup & QC"});
    workspaces.select({Text: "Worklists"});
    workspaces.select({Text: "Library"});
    
    // exit normally through the menu
    app.exitViaFileMenu(); 
}