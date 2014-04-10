//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script CreateDepartment is keyword for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains one keyword, CreateDepartment
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
//USEUNIT FS_UserManagementDepartments

/* @description This function is keyword 'CreateDepartment'
*/ 
var CreateDepartment = {
   Description: "Create Department",        
   Steps: [
      new StepExecution({
         Description: "create department",
         StepFunction: _CreateDepartment
      })             
   ]
}; 
    
/* @ignore
* @description This function will be used for creating department.
* @param {event} <e> this parameter is event.
*/ 
function _CreateDepartment(e){
   
   this.Status = StepStatus.Failed;
   var keywordParams = this.Parent.KeywordParams;
   var departmentName = keywordParams.DepartmentName;
   var directorName = keywordParams.Director;
   var institutionName = keywordParams.Institution;
   var address = keywordParams.Address;
   var phone = keywordParams.Phone;
   var fax = keywordParams.Fax;
   var url = keywordParams.URL;
   var fieldLength = 40; //max number of symbols that can be typed in the field
   var mainWindow = Applications.getFacSuiteMainWindow(this);
    mainWindow
        .MainMenu
        .Items.Tools.click()
        .Items.UserManagement.click(); 
   var userManagementWindow = getUserManagementWindow(this);
   userManagementWindow.selectDepartmentTab();
   var userManagementDepartment = getUserManagementDepartment(this);
   userManagementDepartment.createNewDepartment();
   var addressArray = userManagementDepartment.splitAddress(address, fieldLength);
   userManagementDepartment.setNewDeparmentValues(departmentName, directorName, institutionName, addressArray);
   userManagementDepartment.close();
   this.Status = StepStatus.Passed;  
}

function getUserManagementWindow(object){
  var userManagementWindow = Applications.getFacSuiteWindow(object)
                                     .waitForWindow({Text: "User Management"})
                                     .cast(FSUserManagementWindow);
  return userManagementWindow;
}   

function getUserManagementDepartment(object){
  var userManagementDepartmentWindow = Applications.getFacSuiteWindow(object)
                                     .waitForWindow({Text: "User Management"})
                                     .cast(FSUserManagementDepartments);
  return userManagementDepartmentWindow;
}   