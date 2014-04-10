//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_FACSuite
//USEUNIT FS_UserManagement

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
        .Items.UserManagement.click(); 
            
    var userManagementWindow = app
        .waitForWindow({Text: "User Management"})
        .cast(FSUserManagement); 
        
    userManagementWindow
        .TabControl
        .click({Text: "Users"}); 
        
    userManagementWindow
        .TabControl
        .click({Text: "Departments"});             
        
    userManagementWindow
        .TabControl
        .click({Text: "Settings"});
            
    userManagementWindow.ExportButton.click();
       
    var path = "c:\\test.xml"; 
    if (aqFile.Exists(path)){ 
        aqFile.Delete(path);
    } 
        
    var saveDialog = app
        .waitForWindow({Text: "Export"})
        .cast(SaveFileDialog);
        
    saveDialog
        .saveFile(path)

    userManagementWindow.ImportButton.click();
                
    var openDialog = app
        .waitForWindow({Text: "Import"})
        .cast(OpenFileDialog);
        
    openDialog
        .openFile(path); 
        
    var confirmationWindow = app
        .waitForWindow({Text: "Import"})
        .cast(WPFConfirmationWindow);
                       
    confirmationWindow.Buttons.click({Text: "Yes"});
    
    userManagementWindow.close(); 
        
    // exit normally through the menu
    app.exitViaFileMenu(); 
}