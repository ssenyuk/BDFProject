//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSWPFComboBox used to work with custom combobox 
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
// 1 02-02-2014 Galina Makhotkina A1QA Created
// 2 02-17-2014 Ivan Getsman A1QA Added getText
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFComboBox

var FSWPFComboBox = WPFComboBox.extend({
  
   /* @description This function will be used to select the values 
   * ​​in the combo box using keyboard input
   * @param {object} <text> this parameter is item for select.
   */
   click: function (text) {
      if (text){
         this.TCObject.Keys(text);
         this.publish("OnClick", {Text: text});
         return this;
      }
   },
   
   /* @description This function will be used to get value 
   * from combobox
   * @returns: value of combobox
   */
   getText: function () {
      return this.TCObject.Text.OleValue;
  }  
})