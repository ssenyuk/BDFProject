//USEUNIT FS_FACSuite

// This test demonstrates closing an unexpected popup.
// The test should fail with a message about unexpected popups
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
        .Items.Help.click()           
        .Items.AboutFACSuite.click();
        
    // make sure the window is showing before firing the error
    app.waitForWindow({Text: "About FACSuite"})

    // fires the app.OnError() method where popups will be detected, logged and closed.
    // See FACSuite app object onError() method. 
    new AppError({Message: "Error in Unit Test 'TestAppOnError'", App: app});
        
    // exit normally through the menu
    app.exitViaFileMenu();               
}