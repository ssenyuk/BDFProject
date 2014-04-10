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
// at least one stats table
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-10-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSStatsGrid = WPFStatsControl.extend({

   RowsItems: [],
   
   /* @description This function will be used for get all rows in statistic table.
   */ 
   getRows: function (){
      this.RowsItems = this.Rows.Items;
      return this.RowsItems;
   },

   /* @description This function will be used for get all cells in row in statistic table.
   * @param {String} <numberRows> this parameter is number rows.
   */ 
   getCells: function (numberRows){             
      this.getRows();
      var cells = this.RowsItems[numberRows].Cells.Items;
      return cells;
   },

   /* @description This function will be used for get text all cells in row in statistic table.
   * @param {String} <numberRows> this parameter is number rows.
   * @param {String} <nameColumn> this parameter is name column.
   */ 
   getCellsText: function(numberRows, nameColumn){
      var cells = this.getCells(numberRows);
      for (var i in cells){
          if (i === nameColumn){
              var text = cells[i].getValue();
              return text;
          }
      }
      this.error("'%s' %s", nameColumn, "not found in 'Statistic'" );
   },
    
   /* @description This function will be used for get text in row in statistic table.
   * @param {String} <numberRows> this parameter is number rows.
   * @param {String} <nameColumn> this parameter is name column.
   */ 
   getRowText: function(numberRow, nameColumn){
      var rowText = [];
      for(var name in nameColumn){
         var text = this.getCellsText(numberRow, nameColumn[name]);
         rowText.push(text);
      }
      return rowText.join(' ');
   },
    
   /* @description This function will be used for get text in row in statistic table.
   * @param {String} <nameColumn> this parameter is name column.
   */ 
   getAllRowsText: function(nameColumn){
      var row = this.getRows();
      var rowsText = [];
      for (var i in row){
         var text = this.getRowText(i, nameColumn);
         rowsText.push(text);
      }
      return rowsText;
   },
     
   /* @description This function will be used for log text of all rows.
   * @param {String} <nameColumn> this parameter is name column.
   */ 
   logAllRows: function(nameColumn){
      var rowsText = this.getAllRowsText(nameColumn);
      for (var i in rowsText){
         this.logMessage(rowsText[i]);
      }
   },
     
   /* @description This function will be used for log sum populations.
   * @param {String[]} <namePopulation> this parameter is name populations.
   */      
   logSum: function(namePopulation){
      var sum = this.getSumEvents(namePopulation);
      this.logMessage(namePopulation.join('+')+"="+sum);
   },
     
   /* @description This function will be used for log sum populations.
   * @param {String[]} <namePopulation> this parameter is name populations.
   */    
   verifySum: function (namePopulation){
      var sum = this.getSumEvents(namePopulation);
      var result = this.getEventsCount("All Events");
      if(sum!==result){
         this.error("Sum not equals");
         return;
      }  
     this.logMessage("Sum of the following number of events is equal to # of All Events")
     return true;
   },
    
   /* @description This function will be used for get count events.
   * @param {String} <nameRow> this parameter is name row.
   */     
   getEventsCount: function(nameRow){
      var row = this.getNumberRow(nameRow);
      var count = +this.getRowText(row, ["Events"]).replace(/\D+/g,"");
      return count;
   },
     
   /* @description This function will be used for get sum populations.
   * @param {String[]} <namePopulation> this parameter is name populations.
   */     
   getSumEvents:function(namePopulation){
      var sum = +0;
      for (var i in namePopulation){     
         sum += this.getEventsCount(namePopulation[i]);
      }
      return sum;
   },
     
   /* @description This function will be used for get number row on name  row.
   * @param {String} <nameRow> this parameter is name row.
   */   
   getNumberRow: function(nameRow){
      var rowsText = this.getAllRowsText(["Name"]);
      for (var i in rowsText){
         var result = rowsText[i].match(RegExp(':'+nameRow)); 
         if (result){
            return i;
         }
      }
   }
})