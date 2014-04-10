//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSExperimentDataSources is test for smoke testing (Application
// Smoke) of BD FACSuite applications
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
// ExperimentView shoud be opened.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-13-2014 Galina Makhotkina A1QA Created
// 2 02-20-2014 Dmitry Lemeshko A1QA Added openTubeProperties()
//===============================================================

//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT FS_DeleteTubeWindow
//USEUNIT CM_pressKey

var FSExperimentDataSources = WPFElement.extend({  
   Button: [],  
   SourcesTube: null,
   ImportFCSFilesButton: "Import FCS Files",
  
   init: function(options){
      this._super(options);
      this.Mapper.map([
         { Name: "SourcesTube", NativeClrObject: "listView", ClassType:WPFListView, Depth: 15 }      
      ]);
   },
      
   /* @description This function will be used for select tube
   * @param {Object} <options> this parameter is used for find element.
   */ 
   selectTube: function(options){
      if (options === undefined){
         options = {Name:"Tube_001"};
      }
      this.SourcesTube.click(options);
   },
    
   /* @description This function will be used for delete tube dialog dialog
   */  
   getDeleteTubeDialog: function(){
      var deleteTube = this.App.waitForWindow({Text: "Delete Tube"})
                               .cast(FSDeleteTubeWindow);
      return deleteTube;
   },
    
   /* @description This function will be used for get all button in data Sources
   */     
   getAllButtons: function(){
      var elements = this.Finder.findAll({ClrClassName: "Button"});
      for (var element in elements){
         this.Button.push(elements[element].cast(WPFButton));
      }
   },

   /* @description This function will be used for navigate data source menu
   * @param {String} <nameMenu> this parameter is name menu.
   */    
   navigateMenu: function(nameMenu) { 
      var navElement = this.Finder.find({
         ClrClassName: "Button", Depth: 15, WPFControlText: nameMenu
      })
      .cast(WPFButton); 
      navElement.click();
   },
    
   /* @description This function will be used to open tube properties window
   * @param {Object} <options> this parameter is used for find element.
   */ 
   openTubeProperties: function(options){
      this.selectTube(options);
       /*var tubeElement;
        if (options) {
            if (options.Name) {
                for (item in this.SourcesTube.Items) {
                    if (this.SourcesTube.Items[item].Name == options.Name) {
                        var tubeElement = this.SourcesTube.Items[item].cast(WPFElement);
                        break;
                    }
                }
            }      
        }
        else{
                 for (item in this.SourcesTube.Items) {
                    if (this.SourcesTube.Items[item].Name == "Tube_001") {
                        var tubeElement = this.SourcesTube.Items[item].cast(WPFElement);
                        break;
                    }
                }
        }
       tubeElement.rightClick();
       Delay(3000);
       tubeElement.TCObject.PopupMenu.Click("Properties");*/
     pressKey('[F4]');
     Delay(2000); 
   }
}); 