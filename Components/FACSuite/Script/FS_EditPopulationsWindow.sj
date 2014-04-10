//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSEditPopulationsWindow used to work with a window edit 
// population by stats control BD FACSuite applications
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
// ExperimentView should be opened. Edit population should be selected
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-07-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_BaseWindow
//USEUNIT BD_WPFCheckbox

var FSEditPopulationsWindow = BaseWindow.extend({  

   Populations: null,
    
   init: function(options){
      this._super(options);
      this.Mapper.map([
         { Name: "Populations", ClrClassName: "TreeView", ClassType: Element, Depth: 30 }         
      ]);
   },
    
   /* @description This function will be used for select other populations
   */  
   addPopulation: function(tubeNamesPopulations){
      for (var i in tubeNamesPopulations){
         var item = this.Finder.find({ClrClassName:"StackPanel","DataContext.GateName.OleValue":tubeNamesPopulations[i]})
                               .cast(Element); 
         var checkItem = item.Finder.find({ClrClassName: "CheckBox"})
                                    .cast(WPFCheckbox);
         checkItem.check();
       }
   }
})