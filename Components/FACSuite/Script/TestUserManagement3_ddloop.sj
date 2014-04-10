//USEUNIT FS_FACSuite
//USEUNIT FS_UserManagement
//USEUNIT FS_UserManagementUsers
//USEUNIT FS_UserManagementDepartments
//USEUNIT FS_UserManagementSettings


var FOLDER_PATH_INI_FILES = "C:\\Test\\ini_files\\";
var DEPARTMENT_INI_FILE_NAME = "department.ini";
var DEPARTMENT_INI_FILE = FOLDER_PATH_INI_FILES + DEPARTMENT_INI_FILE_NAME;

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
    
        
        
        
  //      for( i=0; i< 3; i++) {
   ini = Storages.INI( DEPARTMENT_INI_FILE ); 

   Log.Message("now for the arrays");
   for( i = 1; i<= 3; i++ ){
      value = ini.GetSubSection("goodData").GetOption( i , "");
      deptInfo =  value.split(",");
      Log.Message("myArray of expected values is  " + deptInfo );
      for( prop in deptInfo) {
          Log.Message("prop is " + deptInfo[prop] );
      }
         
        
        
        
        
        
        
    // click the "New" button  
    userManagementWindow.NewDeptButton.click(); 
  
   
   // instantiate a department object
   var userManagementWindowDepartments = app
        .waitForWindow({Text: "User Management"})
        .cast(FSUserManagementDepartments); 
        
  
  
    // enter department info 
   // x = 'Eng ' + i;
    userManagementWindowDepartments.setDepartmentInfo({
       DepartmentName: deptInfo[0],
       InstitutionName: deptInfo[1],
       AddressLine1: deptInfo[2],
       AddressLine2: deptInfo[3],
       AddressLine3: deptInfo[4],
       TelephoneNumber: deptInfo[5],
       FaxNumber: deptInfo[6],
       DepartmentUri: deptInfo[7]  
    });
    // END DEPARTMENTS 
     } // end for
 
  
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