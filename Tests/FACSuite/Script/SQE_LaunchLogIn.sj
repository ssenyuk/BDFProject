//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script LaunchLogIn is keyword for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains one keyword, LaunchLogIn, which is test in
// the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. 
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-18-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_StepExecution
//USEUNIT BD_SqeKeyword
//USEUNIT FS_FACSuite

/* @description This function is keyword 'LaunchLogIn'
*/ 
var LaunchLogIn = {
   Description: "Launches FACSuite (if required) and logs in as specified user",        
   Steps: [
      new StepExecution({
         Description: "Launches FACSuite (if required) and logs in as specified user",
         StepFunction: _LaunchLogIn
      })             
   ]
}; 

/* @ignore
* @description This function will be used to launches FACSuite (if required) and logs in as specified user
* @param {event} <e> this parameter is event.
*/ 
function _LaunchLogIn(e){
   this.Status = StepStatus.Failed;
   var keywoardParams = this.Parent.KeywordParams;
   var userID = keywoardParams.UserID;
   var password = keywoardParams.Password;
   var appManager = new AppManager({
      Apps: [
         new FACSuite() 
      ]
   });
   appManager.runAll();
   appManager
      .Apps
      .FACSuite
      .login({
         UserName: userID, 
         Password: password
       });
   this.Status = StepStatus.Passed; 
}