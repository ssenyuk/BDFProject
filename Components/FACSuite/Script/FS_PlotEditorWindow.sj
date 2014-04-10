//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSPlotEditorWindow used to work with window of the plot's
// properties from worsheet's canvas  of BD FACSuite applications
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
// 1 02-17-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_BaseWindow
//USEUNIT FS_PlotEditorParameters
//USEUNIT FS_PlotEditorGeneral
//USEUNIT FS_PlotEditor

var FSPlotEditorWindow = FSPlotEditor.extend({     
 
   /* @description This function will be used to find tab in Plot Editor Window.
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
    
   /* @description This function will be used for selected 'General' tab in this window.
   */  
   selectGeneralTab: function(){
      this._selectTab("General");
      var tab = this.findTab(FSPlotEditorGeneral);
      return tab;
   },
    
   /* @description This function will be used for selected 'Parameters' tab in this window.
   */  
   selectParametersTab: function(){
      this._selectTab("Parameters");
      var tab = this.findTab(FSPlotEditorParameters);
      return tab;
   }
}); 

///**
// * Contains object that use for edit property plot
// * @author Galina Makhotkina
// * @company A1QA
// */
//var FSPlotEditorWindow = BaseWindow.extend({  
//  
//  ParentPopulation: null,  
//  TabControl: null,
//  
//  init: function(options){
//          this._super(options);
//          this.Mapper.map([
//              { Name: "TabControl", NativeClrObject: "PagesControl", ClassType: WPFTabControl, Depth: 15 }          
//          ]);
//    },
//   
//    /* @description This function will be used to find tab in Plot Editor Window.
//    * @param {String} <object> this parameter is type tab.
//    */ 
//    findTab: function(object){
//        var tab = this.cast(object);
//        return tab;
//    }
//}); 