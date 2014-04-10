//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSDeleteGateConfirmationDialog used use to delete gates 
// BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. FACSuite should be run. From  
// hierarchy window should be selected population. In context menu
// selected 'Delete'
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-19-2014 Ivan Getsman A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFConfirmationWindow

var FSDeleteGateConfirmationDialog = WPFConfirmationWindow.extend({  
     
   /* @description This function will be used for confirmation dialog for the action to continue
   */ 
   clickOk: function(){
      this.Buttons.click({Text: "OK"}); 
   }
}); 
