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

    // react when a new workspace is active
    workspaces.subscribe("OnItemChanged", 
        function(e){
            var workspace = e.Sender.Current; 
            if (workspace.Name == "ExperimentsLandingView"){
            
                workspace
                    .App
                    .MainWindow
                    .waitForReady();             
            
                var menu = workspace
                    .App
                    .MainWindow
                    .MainMenu
                    .Items.File.click()
                    .Items.NewExperiment.click();

                Log.Message("refreshing workspace"); 

                // recognize the new tab
                workspace.refresh(); 
        
                // click the latest added tab
                workspace
                    .byIndex({Index: 0})
                    .click(); 
 
                workspace.log();  
            }
        });

    // select a navigation icon from the left hand toolbar     
    workspaces.select({Text: "Experiments"});      
    // exit normally through the menu
    app.exitViaFileMenu();        
}