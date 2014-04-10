//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSStatsGrid used to work with stats table 
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
// ExperimentView should be opened. On the canvas should be have 
// at least one run pointer stats table
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-20-2014  Ivan Getsman A1QA Created
// 2 02-21-2014  Galina Makhotkina A1QA added getCellTextByName
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_Grid
//USEUNIT FS_RunPointerStatsGridCell

// describes a grid as implemented in experiments/statistics
var FSWPFRunPointerStatsControl = WPFStatsControl.extend({

   FrameworkClassName: "FSRunPointerStatsControl",
   AllowedClassTypes: ["BD.FACSuite.Method.Views.RunPointerStatistics.RunPointerStatsControl"],

   /* @description This function will be used for get text all cells in row in statistic table.
   * @param {String} <numberRows> this parameter is number rows.
   * @param {String} <nameColumn> this parameter is name column.
   */ 
   getCellTextByName: function(nameRow, nameColumn){
      for (var i in this.Rows.Items){
         var nameRowInTable = this.Rows.Items[i].Cells.Items["Name"].getValue();
         if ( nameRowInTable === nameRow){
             var cell = this.Rows.Items[i].Cells.Items[nameColumn.replace(/\s/g, '')];
             var text = cell.getValue();
             return text;
         }
      }
      this.error("'%s' %s", nameColumn, "not found in 'Statistic'" );
   },
    
   _loadCells: function(e){
      var row = e.Params.Row;
      var index = 0; 
      for(var prop in e.Result){
         var cellElement = e.Result[prop];  
         var cell = new FSRunPointerStatsGridCell({
            App: e.Params.App,
            TCObject: cellElement.TCObject
         });
         cell.Column = e.Params.Grid.Columns.byIndex(index); 
         e.Params.Row.Cells.add(cell);
         index++;                               
      }
      e.Params.Grid.Rows.add(row);   
   }    
})
