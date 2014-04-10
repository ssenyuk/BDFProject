//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSOpenFileDialog used to work with the open file dialog  
// of BD FACSuite applications
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
// open file dialog should be opened. 
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-04-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_OpenFileDialog

var FSOpenFileDialog = OpenFileDialog.extend({  
  
   /* @description This function will be used for open file.
   * @param {String[]} <fileName> this parameter is array of name of files.
   * @param {String} <location> this parameter is location file.
   */  
   openFile: function(fileName, location){  
      if (location !== undefined){
         this.TCObject.OpenFile(location);
      }
      if (typeof fileName !== "string"){
          var str = "";
          for(var i in fileName){
              str = aqString.Format("%s\"\"%s", str, fileName[i]);
          }
          fileName = str;
      }     
      if ((this.TCObject) && (this.TCObject.Exists)) {
         this.TCObject.OpenFile(fileName);
      }
      return this;   
   }
}); 

