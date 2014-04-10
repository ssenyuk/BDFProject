//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_FACSuite
//USEUNIT FS_Preferences

function test(){ 
    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            }); 
                
    app
        .MainWindow
        .MainMenu
        .Items.Tools.click()
        .Items.Preferences.click();
                    
    var window = app
        .waitForWindow({Text: "Preferences"})
        .cast(FSPreferences); 
        
    window
        .TabControl
        .click({Text: "Worklists"}); 
        
    window.close();
          
    // exit normally through the menu
    app.exitViaFileMenu(); 
}