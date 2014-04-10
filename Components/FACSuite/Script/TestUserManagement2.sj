//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_FACSuite
//USEUNIT FS_UserManagement
//USEUNIT FS_UserManagementUsers
//USEUNIT FS_UserManagementDepartments
//USEUNIT FS_UserManagementSettings

function test(){

/*
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
    */
        
   var app = new FACSuite()
        .run();
   
    app
        .MainWindow
        .MainMenu
        .Items.Tools.click()
        .Items.UserManagement.click(); 
        
        
    var userManagementWindow = app
        .waitForWindow({Text: "User Management"})
        .cast(FSUserManagement); 
     
    // USERS
    // click the "Users" tab           
    userManagementWindow
        .TabControl
        .click({Text: "Users"});   
    
    // get the Create user button    
    userManagementWindow.Mapper.map([
       { Name: "CreateUserButton", NativeClrObject: "CreateUserButton", ClassType: WPFButton, Depth: 10 }         
    ]);     
    
    // click the "New" button  
    userManagementWindow.CreateUserButton.click();
  
    // instantiate a user object
    var userManagementWindowUsers = app
        .waitForWindow({Text: "User Management"})
        .cast(FSUserManagementUsers); 
  
    // enter user info
    userManagementWindowUsers.setUserInfo({
   
      FirstName: 'Ken', 
      LastName: 'Johnson1',
      UserId: '123456',
      Title: 'Programmer',
      Phone: '4085551212',
      Email: 'me@someemail.com',
      PasswordExpireDate: '10/11/2014',
      TemporaryPassword: 'somepassword',
      Notes: 'This is just an example user. It is also a test of the notes',
      
      Status: 'Inactive',
      Department: 'None',
      Role: 'Administrator'
  
   });   
   
  
    // DEPARTMENTS
    // click the "Departments" tab           
    userManagementWindow
        .TabControl
        .click({Text: "Departments"});   
     
    // get the "New" and "Delete" buttons   
    userManagementWindow.Mapper.map([
            { Name: "NewDeptButton", NativeClrObject: "AddDepartmentButton", ClassType: WPFButton, Depth: 10 },
            { Name: "DeleteDeptButton", NativeClrObject: "DeleteDepartmentButton", ClassType: WPFButton, Depth: 10 }
        ]);     
    
    // click the "New" button  
    userManagementWindow.NewDeptButton.click(); 
  
  
   // instantiate a department object
   var userManagementWindowDepartments = app
        .waitForWindow({Text: "User Management"})
        .cast(FSUserManagementDepartments); 
        
  
    // enter department info 
    userManagementWindowDepartments.setDepartmentInfo({
       DepartmentName: 'Engineering',
       InstitutionName: 'BD Biosciences3',
       AddressLine1: '1234 Main Street',
       AddressLine2: 'San Jose, CA',
       AddressLine3: '95131',
       TelephoneNumber: '4085551212',
       FaxNumber: '4085551214',
       DepartmentUri: 'http://www.someDepartment.com'  
    });
    // END DEPARTMENTS 
   
 
  
    // SETTINGS
    // click the "Settings" tab 
    userManagementWindow
        .TabControl
        .click({Text: "Settings"});   
        
   // instantiate a settings object
    var userManagementWindowSettings = app
        .waitForWindow({Text: "User Management"})
        .cast(FSUserManagementSettings); 
    
    // enter settings info
    userManagementWindowSettings.setUserManagementSettings({
      LockOutAttempts: '3', 
      PasswordExpirationDays: '30 days',
      PasswordExpirationWarningDays: '15 days',
      UserCustomText1: "hello user custom 1",
      UserCustomText2: "hello user custom 2",
      DepartmentCustomText1: "hello dept custom 1",
      DepartmentCustomText2: "hello dept custom 2"
   });    
        
    // END SETTINGS  
  
}