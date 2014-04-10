//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_ExperimentView
//USEUNIT FS_SelectPlotParameters
//USEUNIT FS_FACSuite

//USEUNIT FS_PlotEditor
//USEUNIT FS_PlotEditorGeneral
//USEUNIT FS_PlotEditorParameters

var FSExperimentPanelWorksheets = FSExperimentView.extend({

   FrameworkClassName: "FSExperimentPanelWorksheets",
   //ErrorType: WPFTextBlockError,
   DotPlot2D: null,
   HistPlot1D: null,
   ContourPlot2D: null,
   DensityPlot2D: null, 
   
   init: function(options){
        this._super(options);
        
       var ddoButtons = [];
       
       this.Mapper.map([
                       
            { Name: "DotPlot2D", NativeClrObject: "DotPlot2D", ClassType: WPFButton, Depth: 10 }, 
            { Name: "HistPlot1D", NativeClrObject: "HistPlot1D", ClassType: WPFButton, Depth: 10 },
            { Name: "ContourPlot2D", NativeClrObject: "ContourPlot2D", ClassType: WPFButton, Depth: 10 },
            { Name: "DensityPlot2D", NativeClrObject: "DensityPlot2D", ClassType: WPFButton, Depth: 10 },
            
            { Name: "WorksheetTabControl", NativeClrObject: "WorksheetTabControl", ClassType: WPFTabControl, Depth: 20 }        
                                               
        ]);
        
        
       // ddoButtons = this.Finder.findAll({ClrClassName: "DDORadioButton", Depth: 30});
        
         /*
         
         
        for(var i=0; i< ddoButtons.length; i++){
           Log.Message("We have a button " + ddoButtons[i].TCObject.NativeClrObject.Name);
               // this.StatisticsGrids.push(statsControls[control].cast(WPFStatsControl));    
        }
        */
        
        
              
    },
    
    getWorksheet: function(options) {
        // options.worksheet
         
    },
    create2D_RightClick: function(options ) {
     
       // start and end points for where to place the plot
       var startX = this._getStartX( options );
       var startY = this._getStartY( options );
       var endX = this._getEndX( options );
       var endY = this._getEndY( options );
       
        // start and end points for where to place the plot
        var startX =1;
        var startY =1;
        var endX = 200;
        var endY = 300;
        
        // set start and end points for the plot
        if (options.startX) {
           startX = options.startX;
        }
        if (options.startY) {
           startY = options.startY;
        }
        if (options.endX) {
           endX = options.endX;
        }
        if (options.endY) {
           endY = options.endY;
        }
        
        switch (options.Type) {
           case "DotPlot2D":
              myPlot = this.DotPlot2D;
              break;          
           case "ContourPlot2D":
              myPlot = this.ContourPlot2D;
              break;
           case "DensityPlot2D":
              myPlot = this.DensityPlot2D;
              break;
           default:
              return "you supplied bad argument - options.Type ";
        }   
        
        // left click
        //this.DotPlot2D.click();
        myPlot.click();
        
       /* while(1) { 
        this.DensityPlot2D.click();
        aqUtils.Delay(1000);
        this.ContourPlot2D.click();
        aqUtils.Delay(5000);
         }
         */
        Log.Message("in dot plot");
        
      //  this.TCObject.Drag(startX, startY, endX, endY);
     //   this.DotPlot2D.TCObject.Drag(1, 1, 200, 300);
        // drag
        //this.DotPlot2D.TCObject.Drag( startX, startY, endX, endY);
        
        // drag it to the canvas
        myPlot.TCObject.Drag( startX, startY, endX, endY);
        Log.Message("in dot plot");
      
       // right click to bring out the select plot properties window
       if (this.Canvas) {
          // this.Canvas.TCObject.ClickR(200,300);
           // right click
           this.Canvas.TCObject.ClickR(endX, endY);
       }   
       
       // get a window object for that select plot properties window
       var app = new FACSuite()
        .run();      
       var selectPlotParametersWindow = app
        .waitForWindow({Text: "Select Plot Parameters"})
        .cast(FSSelectPlotParameters);
       
       aqUtils.Delay(2000);
    
       selectPlotParametersWindow.checkShortNames();
    
       options = { XParam: 'FSC', YParam: 'PECy7' };
       // parameters were passed into this function on
       // options.XParam and options.YParam
       selectPlotParametersWindow.selectParameters(options);
         
   },  
   _clickAndDragWsToolIcon: function( myPlot, options) {
       var startX =1;
       var startY =1;
       var endX = 200;
       var endY = 300;
        
       // set start and end points for the plot
       if (options.startX) {
          startX = options.startX;
       }
       if (options.startY) {
          startY = options.startY;
       }
        if (options.endX) {
           endX = options.endX;
        }
        if (options.endY) {
           endY = options.endY;
        }
      myPlot.click();
      myPlot.TCObject.Drag( startX, startY, endX, endY);
   },
   
   _getStartX: function(options ) {
      var startX =1;
      if (options.startX) {
          startX = options.startX;
      }
      return startX;
   },
   _getStartY: function(options ) {
      var startY =1;
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
   },
   _pressF4Key: function () {
      aqUtils.Delay(1000);
      Sys.Keys("[F4]");
      aqUtils.Delay(700);
   }, 
   create1D_LeftClick: function(options) {
   
       // start and end points for where to place the plot
       var startX = this._getStartX( options );
       var startY = this._getStartY( options );
       var endX = this._getEndX( options );
       var endY = this._getEndY( options );
       
       this.HistPlot1D.click();
       this.HistPlot1D.TCObject.Drag( startX, startY, endX, endY);
       
       
       if (this.Canvas) {
         
           this.Canvas.TCObject.Click( endX, endY ); //creates object on screen
           aqUtils.Delay(2000);
           this.Canvas.TCObject.Click( endX, endY ); // highlights it to get ready
                                                     // to bring up plot editor
       }  
       
       // bring up plot editor using F4 key
       this._pressF4Key(); 
       aqUtils.Delay(2000);
       
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
       
        aqUtils.Delay(5000);
        
       // set the parameter 
       //aqUtils.Delay(MY_DELAY_SHORT);        
       plotEditorWindowParameters.setXParamName({
          XParamName: 'FITC-A'      
       }); 
       //aqUtils.Delay(MY_DELAY_SHORT);  
        
   }
   
   
   
});