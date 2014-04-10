//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_FACSuite
//USEUNIT FS_UserManagement


function test(){

/*

    Element information gleaned from object inspector for the User Management dialog,
    add new user detail form: 

    CreateUserButton WPFButton
    AddModeFirstNameTextBox WPFTextBox
    AddModeLastNameTextBox WPFTextBox
    AddModeUserIdTextBox
    AddModeTitleTextBox WPFTextBox
    AddModeStatusComboBox: WPFComboBox: Active, Inactive, Locked
    AddModeDepartmentComboBox WPFComboBox
    AddModeInstitutionComboBox: WPFComboBox - wait for enabled?
    AddModePhoneTextBox WPFTextBox
    AddModeEmailTextBox: WPFTextBox
    AddModeRoleComboBox: WPFComboBox
    GeneratePasswordButton: WPFButton
    AddModeNotesTextBox: WPFTextBox
    AddUserButton: WPFButton
    UserMgmtUsersSelectedUserEditUser_Btn: WPFButton

    ClrClassName: UserDetailsView
    NativeClrObject: SelectedUserUserDetailsView

*/
    
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
        
    //  map spreadsheet columns to form field names.
    //  Property key is the spreadsheet column name, 
    //  the value string is the name of the form field.
    var fieldMapping = {
        FirstName: "AddModeFirstNameTextBox",
        LastName: "AddModeLastNameTextBox",
        UserId: "AddModeUserIdTextBox",
        Title: "AddModeTitleTextBox",
        Department: "AddModeDepartmentComboBox",
        Institution: "AddModeInstitutionComboBox",
        Phone: "AddModePhoneTextBox",
        Email: "AddModeEmailTextBox",
        Role: "AddModeRoleComboBox",
        Notes: "AddModeNotesTextBox"    
    }          
    
    // Read through the data file, create new users and 
    // populate data fields on the user detail form. 
    // Note: the data is not being saved -- could not find a way to delete users once
    // created. 
    // The data file should be kept in the Components project FACSuite/Data directory    
        
    var excel = new Excel({
        FilePath: aqFileSystem.GetCurrentFolder() + "\\Data\\Users.xlsx",
        SheetName: "Sheet1",
        OnRow: function (e) {
            userManagementWindow.CreateUserButton.click();     
            // get the new user details elements
            userManagementWindow.mapForm();
            for (column in e.Row.Columns) {
                var propertyName = fieldMapping[column]; 
                var element = userManagementWindow.Form.Fields[propertyName];
                var value = e.Row.Columns[column];
                if (element instanceof WPFTextBox){
                    element.text(value);
                } else if (element instanceof WPFComboBox){
                    element.click({Text: value});
                }
            }
            userManagementWindow.Form.Fields.GeneratePasswordButton.click(); 
        }
    });
    excel.read();   
            
    userManagementWindow.log(); 
          
    userManagementWindow.close(); 
        
    // exit normally through the menu
    app.exitViaFileMenu(); 
}