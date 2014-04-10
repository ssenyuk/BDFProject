//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script CreateUser is keyword for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains one keyword, CreateUser
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. Logging should be performed 
// on to the application. Experiment's view window should be opened.
// On the canvas must have at least one statistical table.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 04-01-2014 Sergei Senyuk A1QA Created
//===============================================================

//USEUNIT BD_StepExecution
//USEUNIT BD_SqeKeyword 
//USEUNIT CM_ApplicationHelper
//USEUNIT FS_UserManagementWindow
//USEUNIT FS_UserManagementUsers

/* @description This function is keyword 'CreateUser'
*/ 
var CreateUser = {
   Description: "Create User",        
   Steps: [
      new StepExecution({
         Description: "create user",
         StepFunction: _CreateUser
      })             
   ]
}; 
    
/* @ignore
* @description This function will be used for creating new user.
* @param {event} <e> this parameter is event.
*/ 
function _CreateUser(e){

   this.Status = StepStatus.Failed;
   var keywordParams = this.Parent.KeywordParams;
   var firstName = keywordParams.FirstName;
   var lastName = keywordParams.LastName;
   var userID = keywordParams.UserID;
   var title = keywordParams.Title;
   var status = keywordParams.Status;
   var department = keywordParams.Department;
   var phone = keywordParams.Phone;
   var email = keywordParams.Email;
   var role = keywordParams.Role;
   var passExpiration = keywordParams.PasswordExpiration;
   var tempPassword = keywordParams.TemporaryPassword;
   var notes = keywordParams.Notes;
   var options = {firstNameValue: firstName, lastNameValue: lastName, userIDValue: userID, titleValue: title,
                  statusValue: status, departmentValue: department, phoneValue: phone, emailValue: email, roleValue: role,
                  passExpirationValue: passExpiration, tempPasswordValue: tempPassword, notesValue: notes};
   var mainWindow = Applications.getFacSuiteMainWindow(this);
       mainWindow
           .MainMenu
           .Items.Tools.click()
           .Items.UserManagement.click(); 
   var userManagementWindow = getUserManagementWindow(this);
   userManagementWindow.selectUsersTab();
   var userManagementUsers = getUserManagementUsers(this);
   userManagementUsers.createNewUser();
   userManagementUsers.setNewUserValues(options);
   userManagementUsers.close();
   this.Status = StepStatus.Passed;  
}

function getUserManagementWindow(object){
  var userManagementWindow = Applications.getFacSuiteWindow(object)
                                     .waitForWindow({Text: "User Management"})
                                     .cast(FSUserManagementWindow);
  return userManagementWindow;
}   

function getUserManagementUsers(object){
  var userManagementUsersWindow = Applications.getFacSuiteWindow(object)
                                     .waitForWindow({Text: "User Management"})
                                     .cast(FSUserManagementUsers);
  return userManagementUsersWindow;
}   