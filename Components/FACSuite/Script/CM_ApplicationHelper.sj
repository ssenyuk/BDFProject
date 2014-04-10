//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script Applications used to search for the required window
// using 'e' of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. FACSuite should be run. As object 
// should be transmitted object of running function 
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-01-2014 Galina Makhotkina A1QA Created
// 2 02-18-2014 Ivan Getsman A1QA Added setNotes, getNotes, verifyNotes
//===============================================================

var Applications = {

   /* @description This function will be used for get MainWindow.
   * @param {object} <object> this parameter is object of running function.
   * @returns: MainWindow
   */
   getFacSuiteMainWindow: function(object){
      var facSuite = this.getFacSuiteWindow(object);
      return facSuite.MainWindow;
   },
   
   /* @description This function will be used for get FacSuite.
   * @param {object} <object> this parameter is object of running function.
   * @returns: FACSuite
   */
   getFacSuiteWindow: function(object){
      var app = this.getApps(object);
      return app.FACSuite;
   },

   /* @description This function will be used for get FACSimulator.
   * @param {object} <object> this parameter is object of running function.
   * @returns: FACSimulator
   */
   getFacSimulatorWindow: function(object){
      var app = this.getApps(object);
      return app.FACSimulator;
   },

   /* @description This function will be used for get collection of available applications.
   * @param {object} <object> this parameter is object of running function.
   * @returns: collection of available applications
   */
   getApps: function(object){
      var _case = object.Case; 
      var vp = _case.Parent; 
      var appManager = vp.AppManager; 
      return appManager.Apps;
   },
    
   /* @description Used to Note data in order to compare data saved on different steps
   * @param {object} <data> this parameter is data.
   * @returns: collection of available applications
   */
   setNotes: function(data){
      this.Notes = data;
   },

   /* @description Used to get Notes data
   * @returns: collection of available applications
   */
   getNotes: function(){
      return this.Notes;
   },

   /* @description Used to verify if the new Data is equals
   * @returns: collection of available applications
   */
   verifyNotes: function(dataToVerify){
      var status = true;
      for (var i in dataToVerify) {
         status = status&dataToVerify[i]=== this.Notes[i];
      }
      return status;
   }             
}
