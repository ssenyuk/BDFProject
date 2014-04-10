//USEUNIT FS_FACSuite

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
        .log()
        .Items.Help.click()
        .Items.AboutFACSuite.click();
            
    var about = app.waitForWindow({Text: "About FACSuite"}); 
    about
        .log()
        .close();
                        
    // exit normally through the menu
    app.exitViaFileMenu(); 
}