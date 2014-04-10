//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSDeleteTubeWindow used to work with a window confirming 
// the delete Tube from data source BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. FACSuite should be run. Window
// ExperimentView should be opened. Menu Delete for tube should be selected.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-05-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFConfirmationWindow

var FSDeleteTubeWindow = WPFConfirmationWindow.extend({  
  
   Text: "Delete Tube",
   
   /* @description This function will be used for confirmation dialog for the action to continue
   */ 
   clickYes: function(){
      this.Buttons.click({Text: "Yes"}); 
   }
}); 
