//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSTubePropertiesWindow used to work with window of the tube's
// properties if BD FACSuite applications
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
// ExperimentView shoud be opened. Canvas should have at least one plot.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// //===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_BaseWindow
//USEUNIT FS_TubeProperties_Compensation
//USEUNIT FS_TubeProperties

var FSTubePropertiesWindow = FSTubeProperties.extend({     
 
   /* @description This function will be used to find tab in Tube Properties Window.
   * @param {String} <object> this parameter is type tab.
   */ 
   findTab: function(object){
      var tab = this.cast(object);
      return tab;
   },
    
   /* @description This function will be used for selected tab in this window.
   * @param {String} <name> this parameter is name tab.
   */  
   _selectTab: function(name){
      this.TabControl.click({Text:name});
   },
    
   /* @description This function will be used for selected 'Compensation' tab in this window.
   */  
   selectCompensationTab: function(){
      this._selectTab("Compensation");
      var tab = this.findTab(FSTubePropertiesCompensation);
      return tab;
   }
   
 
   
}); 
 