//USEUNIT FS_FACSuite

function testLeftHandNavigationButtons(){
    var app = new FACSuite(); 
    app.run();
    try { 
        var workspaces = app
            .login({
                UserName: 'BDAdministrator', 
                Password: 'bdadministrator'
                })
            .MainWindow
            .Workspaces;

        workspaces.select({Text: "Home"});

        workspaces.subscribe("OnWorkspaceChanged", 
            function(e){
                if (e.Sender.Current.Name == "Library"){
                    e.Sender.Current
                        .LibraryBrowserTreeView
                        .log();
                }
            }); 
        
        workspaces.select({Text: "Library"});

    } finally {       
        //app.close();
    }
}