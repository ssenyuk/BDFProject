//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSSaveExperimentDialog used to work with a window for save  
// name experiment of BD FACSuite applications
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
// ExperimentView shoud be opened. Menu Save As via File menushould
// be selected.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-20-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFConfirmationWindow

var FSSaveExperimentDialog = BaseWindow.extend({  
     
   ExperimentName: null,
   SaveWithoutDataCheckBox: null,
   Buttons: null,

   init: function(options){
      this._super(options);       
          
      this.Mapper.map([
         { Name: "ExperimentName", NativeClrObject: "ExperimentNameTextBox", ClassType: WPFTextBox, Depth: 15 },  
         { Name: "SaveWithoutDataCheckBox", NativeClrObject: "SaveWithoutDataCheckBox ", ClassType: WPFCheckbox, Depth: 15 },
         { Name: "Buttons", NativeClrObject: "ButtonPanel", ClassType: WPFConfirmationButtons, Depth: 5 } 
      ]);
   },
    
   /* @description This function will be used for set Name population
   * @param {String} <name> this parameter is name as 'Name'.
   */     
   inputName: function (name) {
      this.ExperimentName.text(name);
      return this; 
   },
    
   /* @description This function will be used for confirmation dialog for the action to continue
   */ 
   clickOK: function(){
      this.Buttons.click({Text: "OK"}); 
   }
}); 