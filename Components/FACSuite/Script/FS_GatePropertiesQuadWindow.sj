//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSGatePropertiesQuadWindow used use to change properties
// gate of BD FACSuite applications
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
// 1 02-20-2014 Ivan Getsman A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFCheckbox
//USEUNIT FS_Properties

var FSGatePropertiesQuadWindow = FSProperties.extend({

   StatisticsOnly: null,
    
   init: function(options){
      this._super(options);
      this.activate();      
      this.Mapper.map([
          { Name: "StatisticsOnly", NativeClrObject: "chkStatisticsOnlyModeCanBeChanged", ClassType: WPFCheckbox, Depth: 20 }      
      ]);
   }
}); 