//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSWPFComboBox used to work with custom text block 
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// - 
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-03-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var  FSWPFTextBlock= WPFTextBlock.extend({    
   
   /* @description This function will be used to get left coordinates 
   * of textblock 
   * @returns: left coordinate
   */ 
   getLeft: function(){
      return this.TCObject.Left;
   }
})