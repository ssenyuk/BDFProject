//USEUNIT FS_FACSuite

// this test should error when an attempt is made to click a disabled item
function test(){
    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            }); 
                
    var workspaces = app.MainWindow.Workspaces;

    // react when the workspace is changed
    workspaces.subscribe("OnItemChanged", 
        function(e){
            var workspace = e.Sender.Current; 
            if (workspace.Name == "HomeView"){
                HomeWorkspace(workspace); 
            }
        });
    // select a navigation icon from the left hand toolbar     
    workspaces.select({Text: "Home"});
          
    // exit normally through the menu
    app.exitViaFileMenu(); 
}

function HomeWorkspace(workspace){
    var menu = workspace
        .App
        .MainWindow
        .MainMenu; 
    
    // workspace changed, menu items have changed
    menu.refresh(); 
    
    menu
        .Items.File.click()
        .Items.Import.click();
}