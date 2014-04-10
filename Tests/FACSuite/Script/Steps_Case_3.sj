//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script Steps_Case_3 is test for smoke testing 
// (Application Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. Logging should be performed 
// on to the application.
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 04-04-2014 Sergei Seniuk A1QA Created
//===============================================================

//USEUNIT FS_WorklistsWorkspace
//USEUNIT CM_ApplicationHelper
//USEUNIT FS_UserManagementWindow
//USEUNIT FS_UserManagementUsers

/* @description This function is 'getUserManagementWindow' use for step 1.4
*/ 

var GetUserManagement = {
   Description: "Navigate to Tools -> User Management",
   StepFunction: getUserManagement
};

/* @description This function is 'SelectUser' use for step 1.5
*/ 

var SelectUser = {
   Description: "select user with predetermined ID",
   StepFunction: selectUser
};

/* @description This function is 'VerifyUser' use for step 1.6
*/ 

var VerifyUser = {
   Description: "verify user values",
   StepFunction: verifyUser
};

/* @description This function is 'VerifyUserPhoneAndEmail' use for step 1.7
*/ 

var VerifyUserPhoneAndEmail = {
   Description: "verify user phone and email values",
   StepFunction: verifyUserPhoneAndEmail
};


/* @description This function will be used for getting into User Management window
* @param {event} <e> this parameter is event.
*/ 
function getUserManagement(e){
   this.Status = StepStatus.Failed;
   var mainWindow = Applications.getFacSuiteMainWindow(this); 
       mainWindow
        .MainMenu
        .Items.Tools.click()
        .Items.UserManagement.click();
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for selecting predetermined user 
/* in User Management /Users window
* @param {event} <e> this parameter is event.
*/ 

function selectUser(e){
   this.Status = StepStatus.Failed;
   var userID = this.StepParams.UserID;
   var userManagementUsers = getUserManagementUsers(this);
   userManagementUsers.selectUserByID(userID);
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for verifying user values 
/* in user data grid
* @param {event} <e> this parameter is event.
*/ 

function verifyUser(e){
   this.Status = StepStatus.Failed;
   var userID = this.StepParams.UserID;
   var firstName = this.StepParams.FirstName;
   var lastName = this.StepParams.LastName;
   var status = this.StepParams.Status;
   var department = this.StepParams.Department;
   var institution = this.StepParams.Institution;
   var userManagementUsers = getUserManagementUsers(this);
   var options = {firstName: firstName, lastName: lastName, userID: userID, status: status, 
                                         department: department, institution: institution};
   userManagementUsers.verifyUserValues(options);
   this.Status = StepStatus.Passed; 
}

/* @description This function will be used for verifying user phone and email 
/* values in user data grid
* @param {event} <e> this parameter is event.
*/ 

function verifyUserPhoneAndEmail(e){
   this.Status = StepStatus.Failed;
   var userID = this.StepParams.UserID;
   var phone = this.StepParams.Phone;
   var email = this.StepParams.Email;
   var userManagementUsers = getUserManagementUsers(this);
   var options = {userID: userID, phone: phone, email: email};
   userManagementUsers.verifyUserValues(options);
   this.Status = StepStatus.Passed; 
}

function getUserManagementUsers(object){
  var userManagementUsersWindow = Applications.getFacSuiteWindow(object)
                                     .waitForWindow({Text: "User Management"})
                                     .cast(FSUserManagementUsers);
  return userManagementUsersWindow;
}   
