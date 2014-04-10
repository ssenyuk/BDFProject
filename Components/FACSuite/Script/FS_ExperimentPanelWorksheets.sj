//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_SelectPlotParameters
//USEUNIT FS_FACSuite
//USEUNIT FS_PlotEditor
//USEUNIT FS_PlotEditorGeneral
//USEUNIT FS_PlotEditorParameters
//USEUNIT FS_Properties
//USEUNIT CM_pressKey
//USEUNIT FS_Plot
//USEUNIT FS_HierarchyWindow
//USEUNIT FS_EditPopulationsWindow
//USEUNIT FS_PlotEditorWindow
//USEUNIT FS_StatsGrid
//USEUNIT FS_SelectPlotParameters
//USEUNIT FS_ConfigureRunPointerStatisticsWindow
//USEUNIT FS_WPFRunPointerStatsControl

var FSExperimentPanelWorksheets = FSExperimentView.extend({
  
   FrameworkClassName: "FSExperimentPanelWorksheets",
   
   PaneWorksheets: null,
   WorksheetTabControl: null,
   DotPlot2D: null,
   HistPlot1D: null,
   ContourPlot2D: null,
   DensityPlot2D: null,
   Canvas: null,
   WorksheetsPanel: null, 
   
   init: function(options){
       this._super(options);
         
       this.Mapper.map([     
            { Name: "Canvas", ClrClassName: "PageCanvas", ClassType: Element, Depth: 30 },
            { Name: "WorksheetsPanel", ClrClassName: "DDORadioButton", ClassType: WPFDDORadioButton,  IsCollection: true,  Depth: 30 }                                                              
        ]);
              
    },
    
    // Keyword definition
    create2D_RightClick: function(options ) {
     
       // start and end points for where to place the plot
       var startX = this._getStartX( options );
       var startY = this._getStartY( options );
       var endX = this._getEndX( options );
       var endY = this._getEndY( options );
       
        switch (options.Type) {
           case "DotPlot2D":
              this.DotPlot2D.click();
              this.DotPlot2D.TCObject.Drag( startX, startY, endX, endY);           
              break;          
           case "ContourPlot2D":
              this.ContourPlot2D.click();
              this.ContourPlot2D.TCObject.Drag( startX, startY, endX, endY);           
              break;            
           case "DensityPlot2D":
              this.DensityPlot2D.click();
              this.DensityPlot2D.TCObject.Drag( startX, startY, endX, endY);           
              break;              
           default:
              return "you supplied bad argument - options.Type ";
        }   
   
       // right click to bring out the select plot properties window
       if (this.Canvas) {      
           this.Canvas.TCObject.ClickR(endX, endY);
       }   
      
       // get a window object for that select plot properties window
       var app = new FACSuite()
        .run();      
       var selectPlotParametersWindow = app
        .waitForWindow({Text: "Select Plot Parameters"})
        .cast(FSSelectPlotParameters);
       
       
       
       // leave for later, if we ever need it
       //selectPlotParametersWindow.checkShortNames();
    
       // parameters were passed into this function on
       // options.XParamName and options.YParamName  
       selectPlotParametersWindow.selectParameters(options);
       
      // this.PaneWorksheets.init();
      // this.PaneWorksheets.log(); 
   },  
  
   // Keyword definition
   create1D_LeftClick: function(options) {
   
    Log.Message("Entering create1D_LeftClick:" + aqDateTime.Now());

       // start and end points for where to place the plot
       var startX = this._getStartX( options );
       var startY = this._getStartY( options );
       var endX = this._getEndX( options );
       var endY = this._getEndY( options );
       
       this.HistPlot1D = this.getWorksheets("HistPlot1D");
       this.HistPlot1D.click();
    //   this.HistPlot1D.TCObject.Drag( startX, startY, endX, endY);
       
       
       if (this.Canvas) {
         
           this.Canvas.TCObject.Click( endX, endY ); //creates object on screen
           aqUtils.Delay(2000);
           this.Canvas.TCObject.Click( endX, endY ); // highlights it to get ready
                                                     // to bring up plot editor
       }  
       
       
       // bring up plot editor using F4 key 
       pressKey('[F4]'); 
      
       
   
       Log.Message("before plot editor create1D_LeftClick:" + aqDateTime.Now());
         
       // get plot editor window 
       var app = new FACSuite().run();
       var plotEditorWindow = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditor);
        
       Log.Message("before move param create1D_LeftClick:" + aqDateTime.Now());
          
       // Move to Parameters tab
       plotEditorWindow
         .TabControl
         .click({Text: "Parameters"}); 
              
        Log.Message("before get param window create1D_LeftClick:" + aqDateTime.Now());
           
       // now get a parameters tab object
       var plotEditorWindowParameters = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditorParameters);
        
       Log.Message("before get setXParam create1D_LeftClick:" + aqDateTime.Now());
       
     
       // set XAxis parameter
       plotEditorWindowParameters.setXLabel( options );
       
       // set Axis Scale (not in the KW but just doing it to prove 
       //                 the combo box works here)  
      // plotEditorWindowParameters.setXParamScale( options ); 
       
       Log.Message("after get setXParam create1D_LeftClick:" + aqDateTime.Now());
       aqUtils.Delay(5000);
       
       plotEditorWindow.close();
       
       //aqUtils.Delay(MY_DELAY_SHORT);  
       Log.Message("Entering create1D_LeftClick:" + aqDateTime.Now()); 
   },
   
   
   // Keyword definition
    create2D_LeftClick: function(options ) {
     
       // start and end points for where to place the plot
       var startX = this._getStartX( options );
       var startY = this._getStartY( options );
       var endX = this._getEndX( options );
       var endY = this._getEndY( options );
       
        switch (options.Type) {
           case "DotPlot2D":
              this.DotPlot2D.click();
              this.DotPlot2D.TCObject.Drag( startX, startY, endX, endY);           
              break;          
           case "ContourPlot2D":
              this.ContourPlot2D.click();
              this.ContourPlot2D.TCObject.Drag( startX, startY, endX, endY);           
              break;            
           case "DensityPlot2D":
              this.DensityPlot2D.click();
              this.DensityPlot2D.TCObject.Drag( startX, startY, endX, endY);           
              break;              
           default:
              return "you supplied bad argument - options.Type ";
        }   
   
       // left click to bring out the select plot properties window
       if (this.Canvas) {      
           this.Canvas.TCObject.Click( endX, endY ); //creates object on screen
           aqUtils.Delay(2000);
           this.Canvas.TCObject.Click( endX, endY ); // highlights it to get ready
                                                     // to bring up plot editor
       }
         
       // bring up plot editor using F4 key    
       pressKey('[F4]');
     
       
       // get plot editor window 
       var app = new FACSuite().run();
       var plotEditorWindow = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditor);
       
          
       // Move to Parameters tab
       plotEditorWindow
         .TabControl
         .click({Text: "Parameters"});      
           
       // now get a parameters tab object
       var plotEditorWindowParameters = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditorParameters);
          
        
       // set the parameter      
         plotEditorWindowParameters.setXParamName(options ); // awaiting defect fix 
         plotEditorWindowParameters.setXParamScale(options ); // just for show, will be removed later  
         plotEditorWindowParameters.setYParamName(options ); //awaiting defect fix
         plotEditorWindowParameters.setYParamScale(options );  // just for show, will be removed later    
        
       plotEditorWindow.close();
             
    },
    
    /*
    parameters 
       plot - plot object which is generally found right before
              calling this method. 
       options 
          startX - Upper left corner of gate; it is relative to upper left
                   hand corner of the plot
          startY- Upper left corner of gate; it is relative to upper left
                   hand corner of the plot 
          endX   -  Lower right hand corner of the gate; it is basically 
                   the distance from startX    
          endY   - Lower right hand corner of the gate; it is basically 
                   the distance from startY.
    
    */
    drawGate: function(plot, options) {
    
       Log.Message("entering drawGate method");
          
       this.Rectangle.click( ); 
       // Sample call.     
       //plot.TCObject.Drag(75,25,105,115);    
       plot.TCObject.Drag(options.startX, options.startY, options.endX, options.endY);
       plot.TCObject.Click();
         
    },

    renameGate: function(plot,options) {
    
        // We know the exact points to click on to hightlight this 
        // gate, and that will work fine for this step.  In the future
        // we will want to write some additional code to search through
        // all the gates on this plot, select by name, and highlight. 
        plot.TCObject.Click( options.startX, options.startY ); // highlight the gate. 
        
        pressKey('[F4]'); //bring out the properties window. Note: If plot editor window
                          // comes up, then you did not get the focus on the gate. The
                          // step above gets the focus on the gate. 
        
        // get a window object for properties window
        var app = new FACSuite()
        .run();      
        var PropertiesWindow = app
        .waitForWindow({Text: "Properties"})
        .cast(FSProperties);
   
        // set gate name     
        //options get passed in from orignal calling program, currently TestGates. 
        //and the options passed in would look like this var options = { txtName: 'MNEs', ...other stuff };   
        PropertiesWindow.setGateName(options);
      
    },
    
    /**
    Description:  Goes through all the plots on the screen and finds the 
                  one you want based upon what options you passed to it. 
                  You can pass
                     XAxis, YAxis, and Title
                  or XAxis, YAxis,
                  or XAxis
    
    Comments:  You can add checks for more combinations of options later. 
    */
    findPlot: function(options) { 
    
         plotGrids = this.Canvas.Finder.findAll({ClrClassName: "PlotControl", Depth: 30});
         PlotGrids = [];
         PlotGridResults = []; 
         for(var grid in plotGrids){ // get all the plots
            this.PlotGrids.push(plotGrids[grid].cast(FSPlot)); //push them onto an array
            var theGrid = plotGrids[grid].cast(FSPlot); // cast it, and set it to "theGrid"
            
            // This if/else block checks what options you passed in, then 
            // based on that, checks for a match. If there is a match it gets
            // pushed onto the results array. 
            if ( options.txtXParameter && options.txtYParameter && options.Title) {
               if (theGrid.txtXParameter.Text ==  options.txtXParameter &&
                   theGrid.txtYParameter.Text ==  options.txtYParameter &&
                   theGrid.Title == options.Title ) {
                       PlotGridResults.push(theGrid);
               }
            } else if ( options.txtXParameter && options.txtYParameter ) {
               if (theGrid.txtXParameter.Text ==  options.txtXParameter &&
                   theGrid.txtYParameter.Text ==  options.txtYParameter  ) {    
                       PlotGridResults.push(theGrid);
               }
            } else if (options.txtXParameter) {
               if (theGrid.txtXParameter.Text ==  options.txtXParameter ) {   
                  PlotGridResults.push(theGrid);
               }
            } else {
               return "Did not pass in correct options value(s). try setting options again";
            }
         }
            // At this point you have filled up your results array. 
            // Check to make sure you have just one item in there,
            // and no more than that. 
            if ( PlotGridResults.length == 1 ) {
               return PlotGridResults[0];
            } else if ( PlotGridResults.length == 0) {
               return "Did not find a plot";
            } else {
               return "Found more then one plot";
            } 
    },
    
   /* @description This function will be used for get buttons in worksheets
   * @param {String} <name> this parameter is name button 
   * @returns button
   */   
   getWorksheets: function(name){
      for (var i in this.WorksheetsPanel){
         if (this.WorksheetsPanel[i].Name === name){
            return this.WorksheetsPanel[i];
         }
      }
      var button = this.Finder.find({ClrClassName: "DDOButton", ToolTip: name})
                              .cast(WPFClickable);
      return button;      
   },
   
   /* @description This function will be used for select buttons in worksheets
   * @param {String} <name> this parameter is name button 
   */   
   selectWorksheets: function(name){
      var button = this.getWorksheets(name);   
      button.click();
   },
   
   /* @description This function will be used for select Quad button in worksheets
   */   
   selectQuadButton: function(){
      this.selectWorksheets("Quad");
   },
   
   /* @description This function will be used for select Display Hierarchy button in worksheets
   */   
   selectDisplayHierarchyButton: function(){
      this.selectWorksheets("Display Hierarchy");      
      var hierarchyWindow = this.waitHierarchyWindow();
      hierarchyWindow.setCoordinates();                                          
   },
   
   /* @description This function will be used for select Undo button in worksheets
   */   
   selectUndoButton: function(){
      var button = this.Finder.find({ClrClassName: "DDOButton", ImageName: "undo"})
                              .cast(WPFClickable);
      button.click();
   },
   
  /* @description This function will be used for edit property of dialog
   * @param {String} <options> this parameter is name of plot.
   */ 
   getPlotEditorWindow: function(options){
      var selectedPlot = this.findPlot(options);
      selectedPlot.rightClick();
      this.selectWorksheetPopupMenu("Properties"); 
      var plotEditorWindow = this.waitPlotEditorWindow();
      return plotEditorWindow;
   },
   
   /* @description This function will be used for select gate 
   * @param {String} <options> this parameter is name of gate.
   * @param {String} <name> this parameter is name of gate.
   */ 
   selectGate: function(options, name){
      var plot = this.findPlot(options);
      if(!name){
         name = "P1";
      }
      var selector = {ClrClassName: "TextBlock", Text: name};
      if (options.path) {
         selector = {ClrClassName:"Path","DataContext.Id":options.path};
      }
      plot.click(selector);
   },
     
   /* @description This function will be used for select plot 
   * @param {String} <options> this parameter is name of plot.
   * @param {String} <name> this parameter is name of plot.
   */ 
   getPropertiesGateWindow: function(options, name){
      if (options.option === "Hierarchy"){
         var hierarchyWindow = this.waitHierarchyWindow();
         if (!options.NamePopulation){
            options.NamePopulation ="P1";
         }
         hierarchyWindow.openAllExpandes();          
         hierarchyWindow.selectOptionProperties(options.NamePopulation);
      }
      else {
         this.selectGate(options, name);
         if (options.option === "F4"){
            Keyboard.setText("[F4]");
         }
         if (!options.option){
            var gate = this.Worksheet.Finder.find({ClrClassName: "IntervalAdorner"})
                                            .cast(WPFClickable);                               
            gate.rightClick();                 
            gate.PopupMenu.click({Path: "Properties"});   
         }
      }
      var propertiesGateWindow = this.waitGatePropertiesWindow();
      return propertiesGateWindow;                
   },  
    
   /* @description This function will be used for select popup menu
   * @param {String} <patch> this parameter is patch for select menu 
   */ 
   selectWorksheetPopupMenu: function(patch){
      this.Worksheet.PopupMenu
                    .click({Path: patch});
   },
   
   /* @description This function will be used for edit population dialog
   * @param {String} <nameGrids> this parameter is name grids.
   */ 
   getPopulationsDialog: function(nameGrids){
      var statisticsGrids = nameGrids? this.getStatisticsGridByName(nameGrids) : this.getFirstStatisticsGrid();
      statisticsGrids.rightClick();
      this.selectWorksheetPopupMenu("Edit Populations...");
      if (nameGrids) {
         var editPopulationsDialog = this.App.waitForWindow({Text: "Configure Run Pointer Statistics"})
                                             .cast(FSConfigureRunPointerStatisticsWindow);
         return editPopulationsDialog;
      }
      var editPopulationsDialog = this.App.waitForWindow({Text: "Edit Populations"})
                                          .cast(FSEditPopulationsWindow);
      return editPopulationsDialog;
   },
    
   /* @description This function will be used for edit statistics dialog
   * @param {String} <nameGrids> this parameter is name grids.
   */ 
   getStatisticsDialog: function(nameGrids){
      var statisticsGrids = nameGrids? this.getStatisticsGridByName(nameGrids) : this.getFirstStatisticsGrid();
      statisticsGrids.rightClick();
      this.selectWorksheetPopupMenu("Edit Statistics...");
      var editStatisticsDialog = this.App.waitForWindow({Text: "Configure Run Pointer Statistics"})
                                             .cast(FSConfigureRunPointerStatisticsWindow);
      return editStatisticsDialog;
   },
    
   /* @description This function will be used for create statistic table in canvas
   */ 
   createStatisticsTable: function(path){
      var statisticsButton = this.getWorksheets("Statistics"); 
      statisticsButton.rightClick();
      statisticsButton.PopupMenu.click({Path: path});
      if (this.Canvas) { 
         this.getAllPlots();
         var maxTop = 1;
         var maxHeight = 1;
         for (var item in this.PlotGrids){
            if (this.PlotGrids[item].TCObject.Top>maxTop){
                maxTop = this.PlotGrids[item].TCObject.Top;
                maxHeight = this.PlotGrids[item].TCObject.Height;
            }
         }
         var y = maxTop + maxHeight - 200;
         this.Canvas.TCObject.Click(1, y);
      }
   },

   /* @description This function will be used for create plot2D in canvas
   */ 
   createPlot2D: function(options){
      this.selectWorksheets("DotPlot2D");
      if (this.Canvas) {   
         this.getAllPlots() 
         var y = 1; 
         var x = 210*this.PlotGrids.length; 
         if (x > this.Canvas.TCObject.Width){
            x = 1;
            y+= 220 * (this.PlotGrids.length/3)
         }
         this.Canvas.TCObject.ClickR(x, y);
      }
      var selectPlotParametersWindow = this.App.waitForWindow({Text: "Select Plot Parameters"})
                                               .cast(FSSelectPlotParameters);
      selectPlotParametersWindow.selectParameters(options);
   },
   
    // private methods
    _getStartX: function(options ) {
      var startX = 1;
      if (options.startX) {
          startX = options.startX;
      }
      return startX;
   },
   _getStartY: function(options ) {
      var startY = 1;
      if (options.startY) {
          startY = options.startY;
      }
      return startY;
   }, 
   _getEndX: function(options ) {
      var endX =1;
      if (options.endX) {
          endX = options.endX;
      }
      return endX;
   },
   _getEndY: function(options ) {
      var endY =1;
      if (options.endY) {
          endY = options.endY;
      }
      return endY;
   }

});