//USEUNIT FS_FACSuite

function test(){
    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            }); 
                
    var main = app.MainWindow;
    
    main.LoginButtons.click({Text: "Admin User"});
    var popup = app.waitForWindow({Text: "My Profile"});  
    popup.close(); 
        
    main.LoginButtons.click({Text: "_Preferences"});
    popup = app.waitForWindow({Text: "Preferences"});  
    popup.close();
        
    main.LoginButtons.click({Text: "Log Out"});
    popup = app.waitForWindow({Text: "Logout Confirmation"});  
    popup.close();
        
    // exit normally through the menu
    app.exitViaFileMenu(); 
}