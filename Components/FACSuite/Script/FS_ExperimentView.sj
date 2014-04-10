// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-21-2014 Galina Makhotkina A1QA Added waitHierarchyWindow,
// waitGatePropertiesWindow, waitPlotEditorWindow
// 2 02-22-2014 Ivan Getsman A1QA Added getStatisticsFromGridByNameOfRow,
// getStatisticsGridByName
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_Plot
//USEUNIT CM_pressKey
//USEUNIT FS_HierarchyWindow
//USEUNIT FS_EditPopulationsWindow
//USEUNIT FS_PlotEditorWindow
//USEUNIT FS_StatsGrid
//USEUNIT FS_SelectPlotParameters
//USEUNIT FS_ConfigureRunPointerStatisticsWindow
//USEUNIT FS_WPFRunPointerStatsControl
//USEUNIT FS_Properties

var FSExperimentView = WPFElement.extend({
    Canvas: null,
    StatisticsGrids: [],
    PlotGrids: [],
    startX: null,
    startY: null,
    endX: null, 
    endY: null,
    expressionButton: null,
    Name: "ExperimentView",
    SourcesTube: null,
    Worksheet: null, 
    WorksheetsPanel: null,

    PaneWorksheets: null, // it's panel with  Worksheets buttons and canvas
    
    init: function(options){
       
        this._super(options);
        this.Mapper.map([
            { Name: "Canvas", ClrClassName: "PageCanvas", ClassType: Element, Depth: 30 },
            { Name: "WorksheetsPanel", ClrClassName: "DDORadioButton", ClassType: WPFDDORadioButton,  IsCollection: true,  Depth: 30 } ,
            { Name: "PaneWorksheets", ClrClassName: "WorkspacePane", ClassType: WPFElement, Depth: 30 },
            { Name: "Worksheet", ClrClassName: "Worksheet", ClassType: WPFElement, Depth: 40 },
            { Name: "expressionButton", NativeClrObject: "ExpressionExtension", ClassType:WPFDDORadioButton, Depth: 20}             
        ]);
        this.refresh();   
    },
    refresh: function(){
        var statsControls = null, plotGrids = null; 
         
        if (this._super){
            this._super(); 
        } 
                       
    },
    
    // Create New Expression
    CreateNewExpression: function(options){

        if (this.expressionButton.Enabled && this.expressionButton.Visible){  
        
             this.expressionButton.log();

             Log.Message("in handle expression"); 
             
               if( this.Canvas ){     
                 this.expressionButton.click();     
                 this.Canvas.TCObject.Click(150,50);                 
               }
        
        }//if
    },
    
    //get all statistics views
    getAllStatistics: function(){
    
        this.StatisticsGrids = []; 
        this.PlotGrids = []; 
        
        if (this.Canvas){
            statsControls = this.Canvas.Finder.findAll({NativeClrObject: "StatisticsView", Depth: 30});
            var runPointerStatsControls = this.Canvas.Finder.findAll({NativeClrObject: "RunPointerStatisticsView", Depth: 30});
            StatisticsGrids = []; 
            for(var control in statsControls){
                this.StatisticsGrids.push(statsControls[control].cast(WPFStatsControl));    
            }
            for(var control in runPointerStatsControls){
                this.StatisticsGrids.push(runPointerStatsControls[control].cast(FSWPFRunPointerStatsControl));    
            }
        }
    },
     
    //get all plots in view
    getAllPlots: function(){
        this.PlotGrids = []; 
        //
        if (this.Canvas){
            plotGrids = this.Canvas.Finder.findAll({ClrClassName: "PlotControl", Depth: 30});
            PlotGrids = []; 
            for(var grid in plotGrids){
                this.PlotGrids.push(plotGrids[grid].cast(WPFPlotControl));    
            } 
        }
    },     
   
   /* @description This function will be used to wait Display Hierarchy window
   */  
   waitHierarchyWindow: function(){
      var hierarchyWindow = this.App.waitForWindow({Text: "Hierarchy"})
                                    .cast(FSHierarchyWindow);
      return hierarchyWindow;
   },
   
   /* @description This function will be used to find Gate Properties window
   */     
   waitGatePropertiesWindow: function() {    
      var window = this.App.waitForWindow({Text: "Properties"})
                           .cast(FSProperties);
      return window;
   },
   
   /* @description This function will be used to find plot editor window
   */     
   waitPlotEditorWindow: function() {    
      var window = this.App.waitForWindow({Text: "Plot Editor"})
                           .cast(FSPlotEditorWindow);
      return window;
   },

    /* @description This function will be used to find tube properties window
   */     
   waitTubePropertiesWindow: function() {    
      var window = this.App.waitForWindow({Text: "Tube Properties"})
                           .cast(FSTubePropertiesWindow);
      return window;
   },

   /* @description This function will be used for get first table 'Statistic'
   */   
   getFirstStatisticsGrid: function(){
      this.getAllStatistics();
      var statisticsGrids = this.StatisticsGrids[0].cast(FSStatsGrid);
      return statisticsGrids;
   }, 
      
   /* @description This function will be used for get table by name
   */   
   getStatisticsGridByName: function(nameGrid){
      this.getAllStatistics();
      for (var grid in this.StatisticsGrids) {
         if (this.StatisticsGrids[grid].TitleTextBox.Text === nameGrid){
            if (this.StatisticsGrids[grid].ClrClassName === "RunPointerStatsControl"){
               return this.StatisticsGrids[grid].cast(FSWPFRunPointerStatsControl);
            }
            if (this.StatisticsGrids[grid].ClrClassName === "StatsControl"){
               return this.StatisticsGrids[grid].cast(FSStatsGrid);
            }
         }
      }
   }, 
    
   /* @description This function will be used for getting Statistics from Grid
   */ 
   getStatisticsFromGridByNameOfRow: function(gridType,nameOfFirstRow){
      var statistics = this.getStatisticsGridByName(gridType);  
      statistics.logContents();
      var eventsStatistics = null;
      for (var i in statistics.Rows.Items) {
         if (statistics.Rows.Items[i].Cells.Items['Name'].getValue() === nameOfFirstRow) {
             eventsStatistics = statistics.Rows.Items[i].Cells.Items;
         }
      }
      eventsStatisticsForNote = {};
      for (var i in eventsStatistics) {
         eventsStatisticsForNote[eventsStatistics[i].Column.Text] = eventsStatistics[i].getValue();
      }
      return eventsStatisticsForNote;
   },
        //
    logStart: function(){
        Log.AppendFolder("ExperimentView"); 
    } 
});
        