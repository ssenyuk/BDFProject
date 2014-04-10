//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSDeleteTubeWindow used for edit population BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS: 
// An empty database should be loaded. FACSuite should be run. Table from 
// the context menu should be selected 'Edit Population'
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-18-2014 Ivan Getsman A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_BaseWindow
//USEUNIT BD_WPFCheckbox
//USEUNIT FS_ConfigureRunPointerStatisticsDecimalPlaces
//USEUNIT FS_ConfigureRunPointerStatistics

var FSConfigureRunPointerStatisticsWindow = FSConfigureRunPointerStatistics.extend({  
   
   TabControl: null,
   Populations: null,
    
   init: function(options){
        this._super(options);
        this.Mapper.map([    
                { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 5 }    
        ]);
    },

   /* @description This function will be used for select other populations
   */  
   addPopulationWithoutTree: function(tubeNamesPopulations){
      for (var i in tubeNamesPopulations){                  
         var checkItem = this.Finder.find({ClrClassName: "CheckBox","Parent.Parent.DataContext.PopulationName" : tubeNamesPopulations[i]});
         if (checkItem) {
            checkItem.cast(WPFCheckbox).check()
         }
      }
      var btnOK = this.Finder.find({NativeClrObject: "OkButton"}).cast(WPFButton);
      btnOK.click();
   }, 
   
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
   selectDecimalPlacesTab: function(){
      this._selectTab("Decimal Places");
      var tab = this.findTab(FSConfigureRunPointerStatisticsDecimalPlaces);
      return tab;
   },
   
   closeConfigureRunPointerStatisticsWindow: function() {
    
   this.OKButton.click();    
   return this;
   },
   
   getCheckbox: function (statisticName, parameterIndex){

rowItem = this.Finder.find({ClrClassName:"ContentPresenter","DataContext.Name": statisticName, Depth: 20}).cast(WPFElement);
       contentItem = rowItem.Finder.find({ClrClassName:"ContentPresenter","WPFControlIndex":parameterIndex, Depth: 10}).cast(WPFElement);
       checkbox = contentItem.Finder.find({ClrClassName:"CheckBox", Depth: 0}).cast(WPFCheckbox); 

return checkbox;
}
   
})